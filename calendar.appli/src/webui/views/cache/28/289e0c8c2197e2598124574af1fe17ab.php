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

        $this->blocks = [
            'title' => [$this, 'block_title'],
            'content' => [$this, 'block_content'],
        ];
    }

    protected function doGetParent(array $context): bool|string|Template|TemplateWrapper
    {
        // line 1
        return "base.twig";
    }

    protected function doDisplay(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        $this->parent = $this->load("base.twig", 1);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_title(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        // line 4
        yield "<h2 class=\"mb-4 d-flex justify-content-between align-items-center\">
    <span>Liste des événements</span>
    <a href=\"/events/create\" class=\"btn btn-primary\">
        <i class=\"fas fa-plus\"></i> Créer un événement
    </a>
</h2>
";
        yield from [];
    }

    // line 11
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_content(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        // line 12
        yield "<h2 class=\"mb-4 d-flex justify-content-between align-items-center\">
    <span>Liste des événements</span>
    <a href=\"/events/create\" class=\"btn btn-primary\">
        <i class=\"fas fa-plus\"></i> Créer un événement
    </a>
</h2>
<form method=\"get\" action=\"\" class=\"mb-4\">
    <div class=\"row g-2 align-items-end\">
        <div class=\"col-auto\">
            <label for=\"category_id\" class=\"form-label mb-0\">Filtrer par catégorie :</label>
        </div>
        <div class=\"col-auto\">
            <select name=\"category_id\" id=\"category_id\" class=\"form-select\" onchange=\"this.form.submit()\">
                <option value=\"\">Toutes</option>
                ";
        // line 26
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["categories"] ?? null));
        foreach ($context['_seq'] as $context["_key"] => $context["cat"]) {
            // line 27
            yield "                    <option value=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "id", [], "any", false, false, false, 27), "html", null, true);
            yield "\" ";
            if ((($context["selectedCategory"] ?? null) == CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "id", [], "any", false, false, false, 27))) {
                yield "selected";
            }
            yield ">";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["cat"], "label", [], "any", false, false, false, 27), "html", null, true);
            yield "</option>
                ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['cat'], $context['_parent']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 29
        yield "            </select>
        </div>
    </div>
</form>

<table class=\"table table-striped table-bordered\">
    <thead class=\"table-primary\">
        <tr>
            <th>Titre</th>
            <th>Catégorie</th>
            <th>Date(s)</th>
        </tr>
    </thead>
    <tbody>
        ";
        // line 43
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["events"] ?? null));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["event"]) {
            // line 44
            yield "            <tr>
                <td>";
            // line 45
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "title", [], "any", false, false, false, 45), "html", null, true);
            yield "</td>
                <td>
                    ";
            // line 47
            if ((CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", true, true, false, 47) && CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 47))) {
                // line 48
                yield "                        ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, CoreExtension::getAttribute($this->env, $this->source, $context["event"], "category", [], "any", false, false, false, 48), "label", [], "any", false, false, false, 48), "html", null, true);
                yield "
                    ";
            } else {
                // line 50
                yield "                        -
                    ";
            }
            // line 52
            yield "                </td>
                <td>
                    ";
            // line 54
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_start", [], "any", false, false, false, 54), "d/m/Y"), "html", null, true);
            yield "
                    ";
            // line 55
            if ((($tmp = CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 55)) && $tmp instanceof Markup ? (string) $tmp : $tmp)) {
                // line 56
                yield "                        - ";
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, $context["event"], "date_end", [], "any", false, false, false, 56), "d/m/Y"), "html", null, true);
                yield "
                    ";
            }
            // line 58
            yield "                </td>
            </tr>
        ";
            $context['_iterated'] = true;
        }
        // line 60
        if (!$context['_iterated']) {
            // line 61
            yield "            <tr>
                <td colspan=\"3\" class=\"text-center text-muted\">Aucun événement trouvé.</td>
            </tr>
        ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['event'], $context['_parent'], $context['_iterated']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 65
        yield "    </tbody>
</table>

<style>
    .table th, .table td {
        vertical-align: middle;
    }
</style>
";
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
        return array (  186 => 65,  177 => 61,  175 => 60,  169 => 58,  163 => 56,  161 => 55,  157 => 54,  153 => 52,  149 => 50,  143 => 48,  141 => 47,  136 => 45,  133 => 44,  128 => 43,  112 => 29,  97 => 27,  93 => 26,  77 => 12,  70 => 11,  59 => 4,  52 => 3,  41 => 1,);
    }

    public function getSourceContext(): Source
    {
        return new Source("", "list.twig", "/var/www/html/calendar.appli/src/webui/views/list.twig");
    }
}
