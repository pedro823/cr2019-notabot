psql -U postgres -d notabot_development<<EOF
DELETE FROM "captchas";
DELETE FROM "messages";
EOF