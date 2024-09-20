Rails 7.2 connection issue with `use_transactional_tests=false`


``` shellsession
$ while ruby test/system/posts_test.rb -v ; do :; done
Run options: --seed 55813 -v

# Running:

PostsTest1#test_1)_initial_visit = 1.11 s = .
PostsTest2#test_2)_threaded_transactions = 0.00 s = .
PostsTest3#test_3)_visiting_with_a_bad_transaction = [Screenshot Image]: /Users/jon/Developer/rails-transactions/tmp/screenshots/failures_test_3-_visiting_with_a_bad_transaction.png
2.33 s = F


Failure:
PostsTest3#test_3)_visiting_with_a_bad_transaction [test/system/posts_test.rb:39]:
expected to find text "FooBar" in "not found"


bin/rails test test/system/posts_test.rb:36


Finished in 3.446470s, 0.8705 runs/s, 0.8705 assertions/s.
3 runs, 3 assertions, 1 failures, 0 errors, 0 skips
```

