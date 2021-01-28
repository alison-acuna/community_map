# README

https://guides.rubyonrails.org/getting_started.html


Following http://joshfrankel.me/blog/create-a-many-to-many-activerecord-association-in-ruby-on-rails/

For UI on HABTM: https://russt.me/2018/06/many-to-many-user-interface-in-ruby-on-rails-5/

https://blog.teamtreehouse.com/static-pages-ruby-rails


- Determine how to link to multiple pages: https://stackoverflow.com/questions/45258802/how-to-link-to-another-html-erb-file-in-ruby-on-rails
- Move pages home to home page


https://gorails.com/setup/osx/10.12-sierra
https://makandracards.com/makandra/21545-rbenv-how-to-switch-to-another-ruby-version-temporarily-per-project-or-globally

Add rspec

To run spec: `bundle exec rspec`
Following https://relishapp.com/rspec/rspec-rails/docs/gettingstarted
https://medium.com/@amliving/my-rails-rspec-set-up-6451269847f9

https://avdi.codes/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/

https://stackoverflow.com/questions/25877734/rails-4-how-to-reset-test-database

Next Goal:

Move to Has Many/Belongs to both per to address duplication issue

https://stackoverflow.com/questions/21896450/habtm-duplicate-records/21896637#21896637

Use:

validates_uniqueness_of :theme_id, :scope => :game_id
As follows:

class Theme < ActiveRecord::Base
  has_many :games, through: :games_themes
end

class Game < ActiveRecord::Base
  has_many :themes, through: :games_themes
end

class GamesThemes < ActiveRecord::Base
  belongs_to :game
  belongs_to :theme

  validates_uniqueness_of :theme_id, :scope => :game_id
end

https://medium.com/rubycademy/habtm-to-has-many-through-43f68f50e50e

Checklist:

1. Create migration
- `bin/rails generate migration AddPrimaryKeyAndRankToPeopleTags`
2. Adjust migration to include:
```
def change
    rename_table 'people_tags', 'person_tags'
    add_column :person_tags, :id, :primary_key
    add_column :person_tags, :rank, :integer, default: 0
  end
end  
```  
3. Run migration `bin/rails db:migrate VERSION=20210127173620`

4. Update Models

```
class Person < ApplicationRecord
  has_many :person_tags, -> { order(rank: :asc) }
  has_many :tags, through: :person_tags
end
```

```
class PersonTag < ApplicationRecord
  belongs_to :person
  belongs_to :tag
end
```

```
class Tag < ApplicationRecord
  has_many :person_tags
  has_many :people, through: :person_tags
end
```

5. Generate Model for person_tags

`bin/rails generate model PersonTags`
Nope!

Try creating file as stand alone

6. Verify that the change worked -
- Create person with tags
- Display tags with people
- Delete etc

1st Issue

Showing /Users/alisonacuna/Desktop/Repos/community_map/community_map/app/views/tags/show.html.erb where line #6 raised:

Could not find the source association(s) "person" or :people in model PersonTag. Try 'has_many :people, :through => :person_tags, :source => <name>'. Is it one of post or tag?

Finger flub

New issue: People are saving/displaying
We have a dupes issue?

people saving/displaying:

Test still runs fine
https://stackoverflow.com/questions/20266686/whats-the-correct-way-to-add-objects-via-the-has-many-through-association
https://stackoverflow.com/questions/53586779/activerecordrecordinvalid-validation-failed-technologies-portfolio-must-exis

dupes issue:

https://stackoverflow.com/questions/21896450/habtm-duplicate-records/21896637#21896637
https://stackoverflow.com/questions/5129702/ruby-on-rails-activerecord-has-many-through-uniqueness-validation

[2] pry(#<PeopleController>)> @person.person_tags
  PersonTag Load (1.9ms)  SELECT "person_tags".* FROM "person_tags" WHERE "person_tags"."person_id" = $1 ORDER BY "person_tags"."rank" ASC  [["person_id", 4]]
=> [#<PersonTag:0x000000012bc849d0 person_id: 4, tag_id: 1, id: nil, rank: 0>,
 #<PersonTag:0x000000012bca6a58 person_id: 4, tag_id: 1, id: nil, rank: 0>]

The issue is the presenece of a duplicate relationship is causing it to fail to save
https://stackoverflow.com/questions/315792/how-to-avoid-duplicates-in-a-has-many-through-relationship

7. Write a blog post on why to use the newer form.


Next Steps:  visualization POC

https://blog.arkency.com/2017/07/how-to-quickly-add-graphs-and-charts-to-rails-app/

https://developers.google.com/chart/interactive/docs/gallery/orgchart

Checklist:

1. Confirm/Setup javascript https://guides.rubyonrails.org/working_with_javascript_in_rails.html
- https://www.freecodecamp.org/news/how-to-add-javascript-to-your-rails-6-app/
- https://www.jetbrains.com/help/ruby/add-a-javascript-asset-to-the-rails-application.html

Current Issue:

The expected Rails 6 app/javascript/packs folder.  I expect this is because I upgraded. Need to determine how to get this added. 
2. Recreate https://developers.google.com/chart/interactive/docs/gallery/orgchart
3. Pull from https://blog.arkency.com/2017/07/how-to-quickly-add-graphs-and-charts-to-rails-app/ to sub your data



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
