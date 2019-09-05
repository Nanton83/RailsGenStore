Models

User
has_many items through: store

Distributor
has_many :stores, through: :items
has_many :items

Item
belongs_to store (foreign_key store_id:integer)
belongs_to distributer (foreign_key distributor_id:integer)

Store
has_many :items
has_many :distributors through: :items


User
email
user_name
password
cubits
distributer t/f

Distributer

Item
name
brand_name
sku
price

Store
name
location

def create
  @user = User.new(user_params)
  if User.exists?(email: params[:email]) # I think this should be `user_params[:email]` instead of `params[:email]`
    flash[:error] = "User already exists." 
    redirect_to 'whereever/you/want/to/redirect' and return
  end
  if @user.save
    session[:user_id] = user.id
    flash[:success] = "New User created."
    redirect_to '/layouts/application'
  else
    render 'new'
  end
end




# Specifications for the Rails Assessment

Specs:
- [ ] Using Ruby on Rails for the project
- [ ] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [ ] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup
- [ ] Include login
- [ ] Include logout
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

cat tmp/pids/server.pid | xargs -n1 -I pid kill -9 pid