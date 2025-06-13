export function convertMarkdownToHtml(markdown) {
    if (!markdown) return '';

    let html = markdown;

    // Titres
    html = html.replace(/^# (.+)$/gm, '<h1>$1</h1>');
    html = html.replace(/^## (.+)$/gm, '<h2>$1</h2>');
    html = html.replace(/^### (.+)$/gm, '<h3>$1</h3>');

    // Emphase
    html = html.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
    html = html.replace(/\*(.+?)\*/g, '<em>$1</em>');

    // Liens
    html = html.replace(/\[(.+?)\]\((.+?)\)/g, '<a href="$2">$1</a>');

    // Listes avec indentation
    html = html.replace(/^\* (.+)$/gm, '<ul><li style="margin-left: 20px;">$1</li></ul>');
    html = html.replace(/^\d+\. (.+)$/gm, '<ol><li style="margin-left: 20px;">$1</li></ol>');

    // Paragraphes
    html = html.replace(/^(?!<[holu])(.+)$/gm, '<p>$1</p>');

    // Nettoyer les balises paragraphes vides
    html = html.replace(/<p><\/p>/g, '');

    return html;
}
