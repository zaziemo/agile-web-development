module SessionCounter

  private

  def increment_counter
    @counter = session[:counter]
    @counter.nil? ? @counter = 1 : @counter += 1
    session[:counter] = @counter

    if session[:counter] > 5
      @counter_shown = "You visited the catalog #{@counter} times"
    end
  end
end
