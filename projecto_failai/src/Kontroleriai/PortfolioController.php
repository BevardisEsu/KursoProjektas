<?php

namespace Aplikacija\Kontroleriai;

use Aplikacija\FS;

class PortfolioController
{
    public function index()
    {
        {
            // Nuskaitomas HTML failas ir siunciam jo teksta i Output klase
            $failoSistema = new FS('../src/html/portfolio.html');
            $failoTurinys = $failoSistema->getFailoTurinys();
            return $failoTurinys;
        }
    }
}