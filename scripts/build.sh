git clone --depth=1 --single-branch -b main https://github.com/yumata/lampa.git && \
cd lampa && \
rm -fr .git && \
rm -f .dockerignore Dockerfile README.md SECURITY.md LICENSE
zip -9 -r application ./*
mv application.zip ../application.zip
