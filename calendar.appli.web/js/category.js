export class Category {
    constructor(data) {
        this.id = data.id;
        this.label = data.label;
        this.description = data.description;
        this.createdAt = data.created_at;
    }
}
