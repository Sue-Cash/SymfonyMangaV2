<?php

// src/Controller/DashboardController.php
namespace App\Controller;

use App\Repository\MangaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractController
{
    #[Route('/dashboard', name: 'app_dashboard', methods: ['GET'])]
    public function index(Request $request, MangaRepository $mangaRepository): Response
    {
        $title    = $request->query->get('title');         // recherche par titre
        $priceParam    = $request->query->get('price');    // Récupère la chaîne de caractère
        // Convertir la chaîne vide en null sinon convertir en float
        $price    = ($priceParam !== '' && $priceParam !== null) ? (float)$priceParam : null;
        $author   = $request->query->get('author');        // recherche par auteur
        $onlyMine = $request->query->getBoolean('onlyMine'); // checkbox pour filtrer mes mangas

        $userId = $onlyMine ? $this->getUser()->getId() : null;

        $mangas = $mangaRepository->findByFilters($title, $price, $author, $onlyMine, $userId);

        return $this->render('dashboard/index.html.twig', [
            'mangas' => $mangas,
            'filter' => [
                'title'    => $title,
                'price'    => $priceParam, // garder la valeur brute pour pré-remplir le formulaire
                'author'   => $author,
                'onlyMine' => $onlyMine,
            ],
        ]);
    }
}
