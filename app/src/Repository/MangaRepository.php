<?php

// src/Repository/MangaRepository.php
namespace App\Repository;

use App\Entity\Manga;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class MangaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Manga::class);
    }

    /**
     * Recherche des mangas avec plusieurs filtres.
     *
     * Chaque filtre est optionnel et s'applique individuellement.
     *
     * @param string|null $title Recherche par titre (recherche partielle)
     * @param float|null  $price Filtre pour le prix minimum
     * @param string|null $author Recherche par email de l'auteur (créateur)
     * @param bool        $onlyMine Si vrai, limite aux mangas créés par l'utilisateur connecté
     * @param int|null    $userId L'ID de l'utilisateur connecté (nécessaire si $onlyMine est vrai)
     *
     * @return Manga[]
     */
    public function findByFilters(?string $title, ?float $price, ?string $author, bool $onlyMine, ?int $userId): array
    {
        $qb = $this->createQueryBuilder('m');

        // Filtrer par titre si fourni (recherche partielle, insensible à la casse selon le SGBD)
        if (!empty($title)) {
            $qb->andWhere('m.title LIKE :title')
               ->setParameter('title', '%' . $title . '%');
        }

        // Filtrer par prix minimum si fourni
        if (!is_null($price)) {
            $qb->andWhere('m.price >= :price')
               ->setParameter('price', $price);
        }

        // Filtrer par email de l'auteur si fourni (effectue une jointure sur createdBy)
        if (!empty($author)) {
            $qb->join('m.createdBy', 'u')
               ->andWhere('u.email LIKE :author')
               ->setParameter('author', '%' . $author . '%');
        }

        // Si l'option "mes mangas seulement" est activée, filtrer par l'ID de l'utilisateur
        if ($onlyMine && $userId !== null) {
            $qb->andWhere('m.createdBy = :userId')
               ->setParameter('userId', $userId);
        }

        // Par exemple, ordonnez par date de création (en utilisant le nom correct du champ)
        $qb->orderBy('m.created_at', 'DESC');

        return $qb->getQuery()->getResult();
    }
}
