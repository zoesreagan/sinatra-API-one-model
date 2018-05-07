class ItemController < ApplicationController


  # index route
  get '/' do

    @items = Item.all # delete this and replace with: 

    @items.to_json

  end

  # add route 
  # deleted 


  # create route
  post '/' do

    # this is how you add something with ActiveRecord.  
    @item = Item.new
    @item.title = params[:title]
    @item.user_id = params[:user_id] 
    @item.save

    # session[:message] = "You added item \##{@item.id}."

    @item.to_json # we will come back to this
                  

  end

  # destroy route  
  delete '/:id' do
    # there are many ways to do this find statement, this is just one
    # remember you can play around with ActiveRecord by adding binding.pry 
    # and trying stuff out
    @item = Item.find params[:id]
    @item.destroy
    session[:message] = "You deleted item \##{@item.id}"
    redirect '/items'
  end

  # edit route
  # deleted


  # update route
  patch '/:id' do
    # like i said -- lots of ways to do this.  
    # http://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html
    # http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-where
    @items = Item.where(id: params[:id]) 

    # note: .where method gives us an array (Why?). So we must index. 
    # Might there have been a more appropriate query method to use 
    # instead of .where ?
    @item = @items[0]

    @item.title = params[:title]
    @item.save

    session[:message] = "You updated item \##{@item.id}"

    redirect '/items'
  end

end