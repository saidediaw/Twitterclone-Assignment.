module MessagesHelper
    def choose_new_or_edit
        if action_name == 'new'
          confirm_messages_path
        elsif action_name == 'edit'
          message_path
        end
    end
end
