# ravishankar49.com

Personal website of Ravishankar Kurma, data analyst in London.

Everything in this folder is the live site. Upload it as-is to the root of a GitHub repository (or any static host).

| File | What it does |
| --- | --- |
| `index.html` | The whole website |
| `files/` | Roadmap PDF and page images for the Resources section |
| `CNAME` | Tells GitHub Pages to serve the site on ravishankar49.com |
| `robots.txt`, `sitemap.xml` | Help Google find and index the site |
| `og-image.png` | Preview image when the link is shared on LinkedIn, WhatsApp, etc. |
| `favicon.svg` | Browser tab icon |
| `404.html` | Page shown for broken links |

## Go live on GitHub Pages

1. Create a public repository on GitHub (for example `ravishankar49.com`) and upload every file in this folder to its root.
2. Repository **Settings → Pages**: set the source to deploy from the `main` branch, root folder.
3. Under **Custom domain**, enter `ravishankar49.com` and save.
4. At your domain registrar, add these DNS records:
   - `A` records for `@`: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - `AAAA` records for `@`: `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153`, `2606:50c0:8003::153`
   - `CNAME` record for `www`: `ravishankar7781.github.io`
5. Back in **Settings → Pages**, tick **Enforce HTTPS** once it becomes available (can take up to 24 hours).

## Get it into Google

1. Open Google Search Console and add a **Domain** property for `ravishankar49.com`.
2. Add the TXT record Google gives you at your registrar, then click **Verify**.
3. In **Sitemaps**, submit `https://ravishankar49.com/sitemap.xml`.
4. In **URL inspection**, enter `https://ravishankar49.com/` and click **Request indexing**.

Indexing usually takes a few days. Linking the site from LinkedIn, GitHub and Instagram helps Google find it sooner.

## Updating the site

Edit `index.html` (or ask Claude for a new version), upload it to the repository, and GitHub Pages republishes within a minute or two. Update the `lastmod` date in `sitemap.xml` when the content changes.
