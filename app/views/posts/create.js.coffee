$('#social-stream-table').prepend("<%= escape_javascript(render(:partial => "post", :object => @post)) %>")

