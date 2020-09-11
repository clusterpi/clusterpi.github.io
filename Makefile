setup:
	rm -rf docs
	hugo new site docs
	touch docs/.nojekyll	
	cd docs; hugo new blog/welcome.md
	cd docs; wget https://github.com/denmch/ananke-mod/blob/master/exampleSite/config.toml
	cd docs; git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
	cd docs; echo 'theme = "ananke"' >> config.toml
	cd docs; hugo serve
#git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
