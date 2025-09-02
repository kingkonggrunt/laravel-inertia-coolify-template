
<p align="center">
<a href="https://github.com/kingkonggrunt/laravel-inertia-coolify-template">
<img src="https://raw.githubusercontent.com/kingkonggrunt/laravel-inertia-coolify-template/main/public/coolify-logo-transparent.png" alt="Coolify Logo" width="120" height="120">
</a>
<h1 align="center">Laravel Inertia Coolify Template</h1>
<p align="center">
A production-ready Laravel starter template with Inertia.js (Vue) and Docker, optimized for seamless deployment on Coolify.
<br />
<a href="#about-the-project"><strong>Explore the docs »</strong></a>
<br />
<br />
<a href="https://github.com/kingkonggrunt/laravel-inertia-coolify-template/issues">Report Bug</a>
·
<a href="https://github.com/kingkonggrunt/laravel-inertia-coolify-template/issues">Request Feature</a>
</p>
</p>

---

## About The Project

<p align="center">
<img src="https://raw.githubusercontent.com/kingkonggrunt/laravel-inertia-coolify-template/main/public/Laravel.svg" alt="Laravel Logo" width="80" height="80">
<img src="https://raw.githubusercontent.com/kingkonggrunt/laravel-inertia-coolify-template/main/public/vuejs-logo-transparent.png" alt="VueJS Logo" width="80" height="80">
</p>

This project is a comprehensive Laravel 12 starter template for building a robust and modern web application that can be deployed on the Coolify platform. It comes pre-configured with Inertia.js and Vue.js, offering a seamless SPA experience with the simplicity of a traditional monolithic application. It also includes Filament, a TALL stack admin panel builder for rapidly creating beautiful and functional admin interfaces.

One of the primary goals of this template is to simplify the deployment process on Coolify servers. In order to achieve this smooth experience, this template incorporates all the necessary configurations and tweaks to ensure a hassle-free deployment. By using Docker and Docker Compose, we eliminate the need for custom Docker images or external registries, making your deployment process as simple as a `git push`.

### Key Features

*   **Laravel 12:** The latest version of the most popular PHP framework.
*   **Inertia.js + Vue.js:** Build modern single-page applications with server-side routing and controllers.
*   **Coolify Ready:** Pre-configured for seamless deployment on Coolify servers.
*   **Docker & Docker Compose:** Containerise your application for consistent development and production environments.
*   **Filament:** A TALL stack admin panel builder for rapidly creating beautiful and functional admin interfaces.


## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   PHP 8.2+
*   Composer
*   Node.js & npm
*   Docker

### Getting Started

1.  Clone the repo
    ```sh
    git clone https://github.com/kingkonggrunt/laravel-inertia-coolify-template.git
    ```
2.  Install PHP dependencies
    ```sh
    composer install
    ```
3.  Install NPM dependencies
    ```sh
    npm install
    ```
4.  Copy `.env.example` to `.env` and update your environment variables.
    ```sh
    cp .env.example .env
    ```
5.  Generate an application key
    ```sh
    php artisan key:generate
    ```
6.  Run the database migrations
    ```sh
    php artisan migrate
    ```
7.  Start the development server (and vite server)
    ```sh
    composer dev
    ```
    ```sh
    npm run dev
    ```
8. When ready, `git push` to a remote repository and deploy your application to your Coolify server

## Coolify Deployment

This template is designed to work out-of-the-box with Coolify. Here are the key additions and configurations that make this possible:

### Coolify-Specific Additions

*   **`Dockerfile` and `docker-compose.yaml`:** These files are pre-configured to work with Coolify's build and deployment process. The `Dockerfile` uses the `serversideup/php:8.3-fpm-nginx` base image, which is a production-ready image for PHP/Laravel applications that is highly optimised and secure. This eliminates the need for custom build packs or external Docker image registries, simplifying the deployment process significantly.
*   **Proxy Configuration:** The template is configured to work seamlessly with Coolify's proxy (traefik), ensuring correct asset loading and secure connections.
*   **Force HTTPS:** In `app/Providers/AppServiceProvider.php`, we've added a check to force the HTTPS scheme in production. This is crucial when running your application behind a reverse proxy like the one used by Coolify, as it prevents mixed content issues and ensures all generated URLs use HTTPS.
*   **Trusted Proxies:** In `bootstrap/app.php`, we've configured the `TrustProxies` middleware to trust all proxies. This is essential for applications running behind a reverse proxy, as it allows Laravel to correctly identify the client's IP address and other request details. We've also explicitly added the `HEADER_X_FORWARDED_TRAEFIK` header to the list of trusted headers, as this is used by Traefik, the reverse proxy used by Coolify.


### Coolify Configuration

**IMPORTANT!:** Here are the necessary configurations you need to make in Coolify to successfully deploy your application.


*   **Build Pack:** `Docker Compose`
*   **Base Directory:** `/`
*   **Docker Compose File:** `docker-compose.yaml`
*   **Domains for App:** Your domain be `https` and ends with `:8080`. Example: `https://www.example.com:8080`
*   **Advanced** : `TODO`: further testing of cached deployments
    * Auto Deploy: `false`
    * Preview Deployments: `false`
    * Disable Build Cache: `true`
    * Force HTTPS: `true` **IMPORTANT!**
    * Enable Gzip Compression: `true`
    * Strip Prefixes: `true`
    * Raw Compose Deployment: `false`
    * Consistent Container Names: `true` **IMPORTANT!!**: Coolify requires consistent container names when deploying applications via Docker Compose
    * Connect to Predefined Network: `false`
    * Drain Logs: `false`
    * Submodules: `false`
    * LFS: `false`
    * Shallow Clone: `false`
*   **Environment Variables:** An example .env file, `.env.coolify.example`, is provided for reference. A few of them are important.
    *   `APP_KEY`: Laravel encryption key. A new key can be generated with `php artisan key:generate` 
    *   `APP_ENV`: `production` Force HTTP is only configured for production
    *   `APP_URL`: Your application's URL
    *   `ASSET_URL`: **IMPORTANT** Equals your `APP_URL` and is `HTTPS` to prevent mixed content issues
    * Database: This template has been configured to connect to a database. `TODO` : setup for sqlite
        *   `DB_CONNECTION`: `mysql`, `mariadb`, `pgsql`, or `sqlsrv`
        *   `DB_HOST`: Server Address
        *   `DB_PORT`: Server Port
        *   `DB_DATABASE`: Database Name
        *   `DB_USERNAME`: Username
        *   `DB_PASSWORD`: Password


## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: [https://github.com/kingkonggrunt/laravel-inertia-coolify-template](https://github.com/kingkonggrunt/laravel-inertia-coolify-template)
