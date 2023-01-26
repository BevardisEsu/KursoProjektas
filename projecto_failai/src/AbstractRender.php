<?php

namespace Aplikacija;

use Aplikacija\Output;

abstract class AbstractRender
{
    protected $output;

    public function __construct(Output $output)
    {
        $this->output = $output;
    }

    abstract protected function setContent(mixed $content);
}