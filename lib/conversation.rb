class Conversation
  def waiting_for_answer
    STDIN.gets 
  end

  def want_to_exit?(answer)
    answer == "exit"
  end
end