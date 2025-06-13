const API_BASE_URL = 'http://localhost:8888/api';
// const API_BASE_URL = 'http://docketu.iutnc.univ-lorraine.fr:8888/api';

async function fetchFromApi(endpoint) {
    try {
        const response = await fetch(`${API_BASE_URL}${endpoint}`);

        if (!response.ok) {
            throw new Error(`Erreur HTTP ${response.status}: ${response.statusText}`);
        }

        return await response.json();
    } catch (error) {
        console.error(`Erreur lors de la requête à ${endpoint}:`, error);
        throw error;
    }
}

export async function fetchEvents() {
    return await fetchFromApi('/events');
}

export async function fetchEventById(id) {
    return await fetchFromApi(`/event/${id}`);
}

export async function fetchCategories() {
    return await fetchFromApi('/categories');
}

export async function fetchEventsByCategory(categoryId) {
    return await fetchFromApi(`/categories/${categoryId}/events`);
}
