<?php

namespace App\Controller;

use App\Entity\Manga;
use App\Form\MangaType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MangaController extends AbstractController
{
    #[Route('/manga/new', name: 'manga_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $manga = new Manga();
        $form = $this->createForm(MangaType::class, $manga);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Set the creator of the manga as the currently logged in user
            $manga->setCreatedBy($this->getUser());
            
            // Set createdAt and updatedAt as needed
            $manga->setCreatedAt(new \DateTime());
            $manga->setUpdatedAt(new \DateTime());

            $entityManager->persist($manga);
            $entityManager->flush();

            // Redirect to the dashboard after a successful creation
            return $this->redirectToRoute('app_dashboard');
        }

        return $this->render('manga/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/manga/{id}/edit', name: 'manga_edit', methods: ['GET', 'POST'])]
    public function edit(Manga $manga, Request $request, EntityManagerInterface $entityManager): Response
    {
        // Allow editing if admin or if the current user is the creator of the manga
        if (!$this->isGranted('ROLE_ADMIN') && $manga->getCreatedBy()->getId() !== $this->getUser()->getId()) {
            throw $this->createAccessDeniedException('You are not allowed to edit this manga.');
        }

        $form = $this->createForm(MangaType::class, $manga);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manga->setUpdatedAt(new \DateTime());
            $entityManager->flush();

            // Redirect to dashboard after successfully editing
            return $this->redirectToRoute('app_dashboard');
        }

        return $this->render('manga/edit.html.twig', [
            'form' => $form->createView(),
            'manga' => $manga,
        ]);
    }

    #[Route('/manga/{id}/delete', name: 'manga_delete', methods: ['POST'])]
    public function delete(Manga $manga, Request $request, EntityManagerInterface $entityManager): Response
    {
        // Allow deletion if admin or if the current user is the creator of the manga
        if (!$this->isGranted('ROLE_ADMIN') && $manga->getCreatedBy()->getId() !== $this->getUser()->getId()) {
            throw $this->createAccessDeniedException('You are not allowed to delete this manga.');
        }

        if ($this->isCsrfTokenValid('delete' . $manga->getId(), $request->request->get('_token'))) {
            $entityManager->remove($manga);
            $entityManager->flush();
        }

        // Redirect to dashboard after deletion
        return $this->redirectToRoute('app_dashboard');
    }
}
