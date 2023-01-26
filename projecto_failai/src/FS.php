<?php

namespace Aplikacija;

class FS
{
    protected string $fileName;

    public function getFailoTurinys(): string
    {
        return file_get_contents($this->fileName);
    }

    public function setFailoPavadinimas(string $fileName): void
    {
        $this->fileName = $fileName;
    }


}