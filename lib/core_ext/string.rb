class String
  # return now as a mil-format string
  def now_mil
    DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end
