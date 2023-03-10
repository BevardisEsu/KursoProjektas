<?php

namespace Aplikacija;

class Response
{
    public mixed $content;
    public bool $redirect = false;
    public ?string $redirectUrl;

    public function redirect(string $url, mixed $content = null): self
    {
        $this->content = $content;
        $this->redirect = true;
        $this->redirectUrl = $url;
        return $this;
    }
}