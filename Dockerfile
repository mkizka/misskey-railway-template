FROM misskey/misskey:2023.12.2
COPY dist/index.js /index.js
COPY start.sh /start.sh
CMD ["bash", "/start.sh"]
