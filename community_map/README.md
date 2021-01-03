# README

https://guides.rubyonrails.org/getting_started.html

Current Goal: Add HABTM relationship to tags and people

Following http://joshfrankel.me/blog/create-a-many-to-many-activerecord-association-in-ruby-on-rails/

For UI on HABTM: https://russt.me/2018/06/many-to-many-user-interface-in-ruby-on-rails-5/

<%= form.collection_select :tag_id, Tag.order(:name),:id,:name, include_blank: true %>
<%= collection_select(:person, :tag_ids, Tag.all, :id, :name, {}, { :multiple => true } )%>

Current Goal: Add tags array to person object

Status: Tags save and display properly as a sepparate unit
Tags display as a drop down on person form_with

Issue:  Tags don't save for the user nor disply for the user.  There is no tag field in the db for the user, nothing is populated in the  people_tags table

Possible next steps: Rewalk https://russt.me/2018/06/many-to-many-user-interface-in-ruby-on-rails-5/ start to finish since this article has worked before and you may have misconfigured something in the db setup

If that fails, maybe you need an array field in both tags and people for better display and save capabilities?


NS:

Add a back link to individual pages

Research checklist for visualization

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
