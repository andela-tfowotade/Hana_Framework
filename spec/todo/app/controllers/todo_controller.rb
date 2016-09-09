class TodoController < Hana::Controller
 
  def initialize(request)
    @request = request
  end

  def new
    @name = "Adim!"
    @nick_name = "Adim"
  end
 
  def index
    "['Write a book', 'Build a house', 'Get married', 'Buy a car']"
  end
 
  def show
  end
 
  def create
    "Post go swimming"
  end
 
  def update
    "Put Write a book"
  end
 
  def destroy
    "Delete Write a book"
  end
end
