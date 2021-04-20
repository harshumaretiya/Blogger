# README

## What's this

This is a tutorial from [Jumpstart Lab](http://tutorials.jumpstartlab.com/projects/blogger.html#blogger-2) I went through as part of the Odin Project Curriculum. This is not a CSS project, the point is to learn more about the principles of working with Ruby on Rails and understand the necessary conventions required to create a blog using the framework. 

## Screenshot

<p float = 'left'>
    <img src="img/blogger.png" alt="Blogger in action" width="550" height="300">
    <img src="img/blogger1.png" alt="Blogger in action" width="550" height="300">
</p>

## Live Demo

View the live app [here](https://floating-scrubland-56331.herokuapp.com/).

## Tools & Technologies

- Ruby v2.6.5.
- Ruby On Rails v5.2.4.4.
- CSS
- SASS
- SQL Database
- Active Storage
- `paperclip` gem
- `sorcery` gem
- minimagick Image Uploading

## Reflection

It's a good walkthrough touching on routing, controllers, views, models, migrations, relations, and more. For this project, I learnt and took advantage of using a few gems such as `paperclip` (a library that manages file attachments and uploading) and `sorcery` (a lightweight and straightforward authentication service gem). 

Rails are good about telling you what is wrong using errors when in development. Sometimes the errors are obvious whereas others are not. It was helpful to start getting familiar with typical error messages and find the answers without too much fuss.

Tutorial provides only the basic authentication functionality by validating your credentials such as username and password to verify your identity. That way new users can only be created by a first logged in user (aka 'admin'). In order to make the app complete I hardcoded the basic authorization to determine whether the authenticated user can perform certain actions (aka 'edit/delete').

I thought that `heroku run db:migrate` also migrated db content into production. No! Only structure. So in my case, log in was not working in production because there were no users in it. I had to sign test user up again and then it worked. I didn't know that to populate the database with your seed data you need to run `heroku run rake db:seed`. It's important to run `rake db:create` and `rake db:migrate` on development after you've changed your `database.yml` config file. Hope it helps rookies like me out there. As far as I understand, in the future it's better to begin your app with the same database as the one you will need to deploy, and do not use a different database in your development/test.

## Future Improvements

- [ ] Create date-based navigation links. For instance, there would be a list of links with the names of the months and when you click on the month it shows you all the articles published in that month.

- [ ] Create a simple RSS feed for articles using the `respond_to` method and XML view templates
