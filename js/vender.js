import { creaFooter, creaMenu } from "./menu.js";

// Asegurar que el menú y el footer se carguen correctamente
document.addEventListener('DOMContentLoaded', () => {
    creaMenu(document.querySelector('nav'));
    creaFooter(document.querySelector('footer'));

    const formulario = document.getElementById('propertyForm');

    if (!formulario) {
        console.error("El formulario con ID 'propertyForm' no existe en el DOM.");
        return;
    }

    formulario.addEventListener('submit', async function (event) {
        event.preventDefault();

        // Obtener los valores de los campos del formulario
        let imagenUrl = document.getElementById('imagenUrl')?.value;
        let imagenFile = document.getElementById('imagenFile')?.files[0];

        let data = {
            habitaciones: document.getElementById('habitaciones')?.value || "",
            coordenadas: document.getElementById('coordenadas')?.value || "",
            anio: document.getElementById('anio')?.value || "",
            piscina: document.getElementById('piscina')?.value || "",
            descripcion: document.getElementById('descripcion')?.value || "",
            location: document.getElementById('location')?.value || "",
            tipo: document.getElementById('tipo')?.value || "",
            venta: document.getElementById('venta')?.value || "",
            alquiler: document.getElementById('alquiler')?.value || "",
            superficie: document.getElementById('superficie')?.value || "",
            alt: document.getElementById('alt')?.value || ""
        };

        // Validación de campos obligatorios
        if (!data.habitaciones || !data.coordenadas || !data.anio) {
            alert("Por favor, completa todos los campos obligatorios.");
            return;
        }

        // Preparar el envío de datos con FormData si incluye un archivo
        let body;
        let headers = {};

        if (imagenFile) {
            body = new FormData();
            for (let key in data) {
                body.append(key, data[key]);
            }
            body.append('imagen', imagenFile);
        } else {
            data.imagen = imagenUrl || ""; // Usar la URL de la imagen si no hay archivo
            body = JSON.stringify(data);
            headers['Content-Type'] = 'application/json';
        }

        // Realizar la solicitud POST al servidor
        try {
            const response = await fetch('http://localhost:3001/vivienda', {
                method: 'POST',
                headers,
                body
            });

            if (!response.ok) {
                throw new Error(`Error en la solicitud: ${response.statusText}`);
            }

            const vivienda = await response.json();
            console.log(vivienda);

            // Renderizar los datos en el HTML
            renderVivienda(vivienda);
        } catch (error) {
            console.error("Error al enviar los datos:", error);
            alert("Hubo un problema al enviar los datos. Por favor, intenta nuevamente.");
        }
    });
});

// Función para renderizar la vivienda en el DOM
function renderVivienda(vivienda) {
    if (!vivienda || typeof vivienda !== 'object') {
        console.error("Los datos de la vivienda son inválidos:", vivienda);
        return;
    }

    const mainElement = document.querySelector('main');
    if (!mainElement) {
        console.error("No se encontró el elemento <main> en el DOM.");
        return;
    }

    let imagesSection = document.querySelector('#images');

    if (!imagesSection) {
        imagesSection = document.createElement('section');
        imagesSection.id = 'images';
        mainElement.appendChild(imagesSection);
    }

    let tarjeta = document.createElement('div');
    tarjeta.classList.add('tarjeta');

    let titulo = document.createElement('h3');
    titulo.textContent = vivienda.titulo || "Sin título";

    let parrafo = document.createElement('p');
    parrafo.textContent = vivienda.parrafo || "Sin descripción adicional.";

    let imagen = document.createElement('img');
    imagen.src = vivienda.ruta || "https://via.placeholder.com/150";
    imagen.alt = vivienda.alt || "Imagen de la vivienda";
    imagen.classList.add('imagen-vivienda');

    let habitaciones = document.createElement('p');
    habitaciones.textContent = `Habitaciones: ${vivienda.habitaciones || "N/A"}`;

    let coordenadas = document.createElement('p');
    coordenadas.textContent = `Coordenadas: ${vivienda.coordenadas || "N/A"}`;

    let piscina = document.createElement('p');
    piscina.textContent = `Piscina: ${vivienda.piscina ? 'Sí' : 'No'}`;

    let alquiler = document.createElement('p');
    alquiler.textContent = `Alquiler: ${vivienda.alquiler ? 'Sí' : 'No'}`;

    let descripcion = document.createElement('p');
    descripcion.textContent = `Descripción: ${vivienda.descripcion || "N/A"}`;

    let superficie = document.createElement('p');
    superficie.textContent = `Superficie: ${vivienda.superficie || "N/A"}`;

    let venta = document.createElement('p');
    venta.textContent = `Venta: ${vivienda.venta ? 'Sí' : 'No'}`;

    // Añadir los elementos a la tarjeta
    tarjeta.appendChild(titulo);
    tarjeta.appendChild(parrafo);
    tarjeta.appendChild(imagen);
    tarjeta.appendChild(habitaciones);
    tarjeta.appendChild(coordenadas);
    tarjeta.appendChild(piscina);
    tarjeta.appendChild(alquiler);
    tarjeta.appendChild(descripcion);
    tarjeta.appendChild(superficie);
    tarjeta.appendChild(venta);

    // Añadir la tarjeta a la sección de imágenes
    imagesSection.appendChild(tarjeta);
}


/*
import { creaFooter, creaMenu } from "./menu.js";

creaMenu(document.querySelector('nav'))
creaFooter(document.querySelector('footer'))

const formulario = document.getElementById('propertyForm');

formulario.addEventListener('submit', function(event) {
    event.preventDefault();

    let imagenUrl = document.getElementById('imagenUrl').value;
    let imagenFile = document.getElementById('imagenFile').files[0];

    let data = {
        habitaciones: document.getElementById('habitaciones').value
        coordenadas: document.getElementById('coordenadas').value
        anio: document.getElementById('anio').value
        piscina: document.getElementById('piscina').value
        descripcion: document.getElementById('descripcion').value
        imagen: imagenUrl ? imagenUrl : imagenFile, // Esto solo funcionará si el usuario ha seleccionado un archivo o ingresado una URL
        location: document.getElementById('location').value
        tipo: document.getElementById('tipo').value
        venta: document.getElementById('venta').value
        alquiler: document.getElementById('alquiler').value
        superficie: document.getElementById('superficie').value
        alt: document.getElementById('alt').value
    };

    fetch('http://localhost:3001/vivienda', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
});
*/