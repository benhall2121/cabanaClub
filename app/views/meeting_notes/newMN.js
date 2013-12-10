$("#all_meeting_notes").prepend('<%= j render :partial => 'meetings/meeting_notes_box', :locals => {:mn => @meeting_note } %>');

