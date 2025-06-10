<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\CoreExtension;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;
use Twig\TemplateWrapper;

/* base.twig */
class __TwigTemplate_6c45fd668444284ffa819f73c18cddcb extends Template
{
    private Source $source;
    /**
     * @var array<string, Template>
     */
    private array $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
            'title' => [$this, 'block_title'],
            'content' => [$this, 'block_content'],
        ];
    }

    protected function doDisplay(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        // line 1
        yield "<!DOCTYPE html>
<html lang=\"fr\">
<head>
    <meta charset=\"UTF-8\">
    <title>";
        // line 5
        yield from $this->unwrap()->yieldBlock('title', $context, $blocks);
        yield "</title>
    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">
</head>
<body>
<header class=\"bg-primary text-white p-3 mb-3\">
    <div class=\"container\">
        <h1>LaChaudière.net</h1>
    </div>
</header>

<nav class=\"navbar navbar-expand-lg navbar-light bg-light mb-4\">
    <div class=\"container\">
        <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">
           ";
        // line 18
        if ((($tmp =  !(null === ($context["user"] ?? null))) && $tmp instanceof Markup ? (string) $tmp : $tmp)) {
            // line 19
            yield "                    <li><a href=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->env->getRuntime('Slim\Views\TwigRuntimeExtension')->urlFor("logout"), "html", null, true);
            yield "\">Déconnexion</a></li>
                ";
        } else {
            // line 21
            yield "                    <li><a href=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->env->getRuntime('Slim\Views\TwigRuntimeExtension')->urlFor("signin_get"), "html", null, true);
            yield "\">Connexion</a></li>
                ";
        }
        // line 23
        yield "        </ul>
    </div>
</nav>

<main class=\"container\">
    ";
        // line 28
        yield from $this->unwrap()->yieldBlock('content', $context, $blocks);
        // line 31
        yield "</main>

<footer class=\"bg-light text-center text-muted py-3 mt-5\">
    <div class=\"container\">
        <p>© 2025 LaChaudière.net</p>
    </div>
</footer>

</body>
</html>
";
        yield from [];
    }

    // line 5
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_title(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        yield "La Chaudière Agenda";
        yield from [];
    }

    // line 28
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_content(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        // line 29
        yield "        <p>Contenu par défaut</p>
    ";
        yield from [];
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName(): string
    {
        return "base.twig";
    }

    /**
     * @codeCoverageIgnore
     */
    public function isTraitable(): bool
    {
        return false;
    }

    /**
     * @codeCoverageIgnore
     */
    public function getDebugInfo(): array
    {
        return array (  122 => 29,  115 => 28,  104 => 5,  89 => 31,  87 => 28,  80 => 23,  74 => 21,  68 => 19,  66 => 18,  50 => 5,  44 => 1,);
    }

    public function getSourceContext(): Source
    {
        return new Source("", "base.twig", "/var/www/html/calendar.appli/src/webui/views/base.twig");
    }
}
