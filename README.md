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

Be sure your nanoc code has been committed on the "gh-pages" branch and that it is ready to be deployed. Once ready, run the following command:

    rake deploy

This will do all the dirty work such as setting the base_url, re-compiling the whole website (after removing the old ./output directory), optimizing all assets (css/js/images), and commiting it to the "gh-pages" branch. Then it will push the "gh-pages" branch to "origin/gh-pages". Your website should now be deployed at https://github.com/GrimpUp/grimpup.github.io. Once done it'll automatically switch back to the "gh-pages-nanoc" branch, so you're back where you were prior to the deployment procedure.

You may customize the branch names in the `Rakefile`.

## Provider configuration

In order for Github to deliver your website using your custom domain name you will need to:

- cleanup your DNS entries so that it matches the configuration presented in here https://help.github.com/articles/tips-for-configuring-an-a-record-with-your-dns-provider/. That is setup `A`. 
The addresses to use for the `A` will change over time. To get the latests please refer to https://help.github.com/articles/what-ip-addresses-does-github-use-that-i-should-whitelist/. At the moment of writing it is `192.30.252.0/22`.
To check that your configuration is correct use the `dig` command as follow:

    $ dig grimpup.fr +nostats +nocomments +nocmd
    ;; global options: +cmd
    ;grimpup.fr.            IN  A
    grimpup.fr.     970 IN  A   192.30.252.0.XX
    grimpup.fr.     970 IN  A   192.30.252.0.XX

- Once this is done you must configure a `CNAME` (see https://help.github.com/articles/adding-a-cname-file-to-your-repository/) and push it to your repository:

    $ echo 'grimpup.fr' > CNAME
    $ git commit CNAME -m "add CNAME for grimpup.fr"
    $ git push origin gh-pages

You may wait some time (a day or few hours) for the configuration to be effective due to DNS propagation.

**Note**: Github IP addresses may change, as described here https://help.github.com/articles/my-custom-domain-isn-t-working/ If you are using an `A` record that points to 207.97.227.245 or 204.232.175.78, you will need to update your DNS settings, as Github no longer serve Pages directly from those servers.
