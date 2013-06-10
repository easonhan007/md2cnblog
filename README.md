md2cnblog
---------

md2cnblog可以轻松的将markdown格式的文本转换成相应blog提供商所支持的html代码，并自动代码高亮之。

安装方法
```  
  gem install md2cnblog
```
使用方法
```
  mdb mypost.txt -t cnblog > mypost.html # 转成博客园支持的html格式
  mdb mypost.txt -t iteye > mypost.html # 转成iteye和csdn支持的html格式
  mdb mypost.txt  > mypost.html # 转成标准html
```
目前支持的blog有

* cnblog
* iteye
* csdn

Contributing to md2cnblog
=========================
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2013 easonhan. See LICENSE.txt for
further details.

