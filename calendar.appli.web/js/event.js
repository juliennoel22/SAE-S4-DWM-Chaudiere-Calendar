export class Event {
    constructor(data) {
        this.id = data.id;
        this.titre = data.titre; // Changed from this.title to this.titre
        this.date = data.date || data.date_debut;
        this.category = data.categorie || data.category;
        this.description = data.description_md || '';
        this.htmlDescription = data.description_html || '';
        this.price = data.prix || 'Gratuit';
        this.startDate = data.date_debut || data.date;
        this.endDate = data.date_fin || null;
        this.time = data.heure || '';
        this.images = data.images || [];
        this.url = data.url || '';
    }

    hasImage() {
        return this.images && this.images.length > 0;
    }

    getMainImageUrl() {
        if (this.hasImage()) {
            return this.images[0];
        }
        return 'https://via.placeholder.com/300x200?text=Pas+d%27image';
    }

    getFormattedDate() {
        if (!this.startDate) return '';

        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        return new Date(this.startDate).toLocaleDateString('fr-FR', options);
    }

    getTimeStatus() {
        const today = new Date();
        today.setHours(0, 0, 0, 0);

        const eventDate = new Date(this.startDate);
        eventDate.setHours(0, 0, 0, 0);

        const endDate = this.endDate ? new Date(this.endDate) : eventDate;
        endDate.setHours(23, 59, 59, 999);

        if (endDate < today) {
            return 'past';
        } else if (eventDate > today) {
            return 'future';
        }
        return 'current';
    }

    isInCurrentMonth() {
        const today = new Date();
        const eventDate = new Date(this.startDate);

        return today.getMonth() === eventDate.getMonth() &&
            today.getFullYear() === eventDate.getFullYear();
    }
}
