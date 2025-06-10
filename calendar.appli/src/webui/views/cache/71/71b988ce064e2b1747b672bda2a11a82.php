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

/* list.html.twig */
class __TwigTemplate_09972deafbe1e7f8f2abbf87704e9bcb extends Template
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
        ];
    }

    protected function doDisplay(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        // line 1
        yield "<h2>Liste des événements</h2>
<table>
    <thead>
        <tr>
            <th>Titre</th>
            <th>Catégorie</th>
            <th>Date(s)</th>
        </tr>
    </thead>
    <tbody>
        ";
        // line 11
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["events"] ?? null));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["event"]) {
            // line 12
            yield "            <tr>
                <td>";
            // line 13
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "title", [], "any", false, false, false, 13), "html", null, true);
            yield "</td>
                <td>
                    ";
            // line 15
            if ((CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", true, true, false, 15) && CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 15))) {
                // line 16
                yield "                        ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 16), "label", [], "any", false, false, false, 16), "html", null, true);
                yield "
                    ";
            } else {
                // line 18
                yield "                        -
                    ";
            }
            // line 20
            yield "                </td>
                <td>
                    ";
            // line 22
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_start", [], "any", false, false, false, 22), "d/m/Y"), "html", null, true);
            yield "
                    ";
            // line 23
            if ((($tmp = CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 23)) && $tmp instanceof Markup ? (string) $tmp : $tmp)) {
                // line 24
                yield "                        - ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 24), "d/m/Y"), "html", null, true);
                yield "
                    ";
            }
            // line 26
            yield "                </td>
            </tr>
        ";
            $context['_iterated'] = true;
        }
        // line 28
        if (!$context['_iterated']) {
            // line 29
            yield "            <tr>
                <td colspan=\"3\">Aucun événement trouvé.</td>
            </tr>
        ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['event'], $context['_parent'], $context['_iterated']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 33
        yield "    </tbody>
</table>";
        yield from [];
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName(): string
    {
        return "list.html.twig";
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
        return array (  112 => 33,  103 => 29,  101 => 28,  95 => 26,  89 => 24,  87 => 23,  83 => 22,  79 => 20,  75 => 18,  69 => 16,  67 => 15,  62 => 13,  59 => 12,  54 => 11,  42 => 1,);
    }

    public function getSourceContext(): Source
    {
        return new Source("", "list.html.twig", "/var/www/html/calendar.appli/src/webui/views/list.html.twig");
    }
}
