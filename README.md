# CR2019 CTF challenge: notabot

---

Challenge description: 
You, as any good estovakian citizen, know that there is a [Estovakia's Citizen website]. You just received
a leaked news that the vice-president is a corrupt person and is trying to create a Coup d'etat on the
country's president.

Since every message on the website goes directly to the president's cabinet, you decided it was a good idea trying to alert the president through there. However, the vice-president is fast, and is deleting
every message that is older than 15 minutes.

I bet that if you could place, like, 500 messages as the same user at the same time, the president would
notice something strange. Warn him of what's going on.

### Running the challenge

1. Open `.env` and set HOST to the host of your website, API_PORT to an unused port and WEB_PORT to the port
that people will be connecting to.
2. Open `client/Environment.js` and change the API_HOST to what you put at HOST and what you put at 
API_PORT.
3. Run `docker-compose up --build`.