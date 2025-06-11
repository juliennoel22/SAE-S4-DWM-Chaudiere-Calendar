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

/* list.twig */
class __TwigTemplate_c3e7f5248233a7c4b5ec60064faca1e8 extends Template
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
        // line 2
        yield "<h2>Liste des événements</h2>
<form method=\"get\" action=\"\">
    <label for=\"category_id\">Filtrer par catégorie :</label>
    <select name=\"category_id\" id=\"category_id\" onchange=\"this.form.submit()\">
        <option value=\"\">Toutes</option>
        ";
        // line 7
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["categories"] ?? null));
        foreach ($context['_seq'] as $context["_key"] => $context["cat"]) {
            // line 8
            yield "            <option value=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "id", [], "any", false, false, false, 8), "html", null, true);
            yield "\" ";
            if ((($context["selectedCategory"] ?? null) == CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "id", [], "any", false, false, false, 8))) {
                yield "selected";
            }
            yield ">";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "label", [], "any", false, false, false, 8), "html", null, true);
            yield "</option>
        ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['cat'], $context['_parent']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 10
        yield "    </select>
</form>

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
        // line 22
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["events"] ?? null));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["event"]) {
            // line 23
            yield "            <tr>
                <td>";
            // line 24
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "title", [], "any", false, false, false, 24), "html", null, true);
            yield "</td>
                <td>
                    ";
            // line 26
            if ((CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", true, true, false, 26) && CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 26))) {
                // line 27
                yield "                        ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 27), "label", [], "any", false, false, false, 27), "html", null, true);
                yield "
                    ";
            } else {
                // line 29
                yield "                        -
                    ";
            }
            // line 31
            yield "                </td>
                <td>
                    ";
            // line 33
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_start", [], "any", false, false, false, 33), "d/m/Y"), "html", null, true);
            yield "
                    ";
            // line 34
            if ((($tmp = CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 34)) && $tmp instanceof Markup ? (string) $tmp : $tmp)) {
                // line 35
                yield "                        - ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 35), "d/m/Y"), "html", null, true);
                yield "
                    ";
            }
            // line 37
            yield "                </td>
            </tr>
        ";
            $context['_iterated'] = true;
        }
        // line 39
        if (!$context['_iterated']) {
            // line 40
            yield "            <tr>
                <td colspan=\"3\">Aucun événement trouvé.</td>
            </tr>
        ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['event'], $context['_parent'], $context['_iterated']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 44
        yield "    </tbody>
</table>";
        yield from [];
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName(): string
    {
        return "list.twig";
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
        return array (  140 => 44,  131 => 40,  129 => 39,  123 => 37,  117 => 35,  115 => 34,  111 => 33,  107 => 31,  103 => 29,  97 => 27,  95 => 26,  90 => 24,  87 => 23,  82 => 22,  68 => 10,  53 => 8,  49 => 7,  42 => 2,);
    }

    public function getSourceContext(): Source
    {
        return new Source("", "list.twig", "/var/www/html/calendar.appli/src/webui/views/list.twig");
    }
}
