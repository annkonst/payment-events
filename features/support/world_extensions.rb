def wait_for(error = nil, timeout_in_seconds = 7, &block)
  counter = timeout_in_seconds * 5
  exit_requested = false
  Kernel.trap( "INT" ) { exit_requested = true }
  while counter > 0
    break if exit_requested
    return if yield
    sleep 0.2
    counter -= 1
  end
  error_message = "Failure waiting for #{error || block.source_location}"
  fail error_message
end