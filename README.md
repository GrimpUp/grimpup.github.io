view the current website at http://grimpup.github.io/

## Setup environment

Install ruby `gems` and bower `components`

    bundle install
    bower install

## Start the file server

    nanoc compile
    nanoc view

## Auto-compiling when you update files

    bundle exec guard

Now visit `http://127.0.0.1:3000/` and there you go. This should display your website. Each time you update a file that changes the look of the web page, Guard will run the nanoc compiler to update the end result which you can directly view in the browser.

## Github deployment

Be sure your nanoc code has been committed on the "gh-pages-nanoc" branch and that it is ready to be deployed. Once ready, run the following command:

    rake deploy

This will do all the dirty work such as setting the base_url, re-compiling the whole website (after removing the old ./output directory), optimizing all assets (css/js/images), and commiting it to the "gh-pages" branch. Then it will push the "gh-pages" branch to "origin/gh-pages". Your website should now be deployed at https://github.com/GrimpUp/grimpup.github.io. Once done it'll automatically switch back to the "gh-pages-nanoc" branch, so you're back where you were prior to the deployment procedure.

You may customize the branch names in the `Rakefile`.
