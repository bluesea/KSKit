# KSKit
轻量化AppDelegate，针对项目后期越来越臃肿的AppDelegate的方案
集成umeng分享、umeng统计、个推、 bugly等功能

请自行选择集成

TODO:

融云

微信、支付宝支付

## 首页文章列表

<img src="http://qiniu.pingyifan.com/uPic/001%20-%20%E9%A6%96%E9%A1%B5%E6%96%87%E7%AB%A0%E5%88%97%E8%A1%A8.png" style="zoom:67%;" />





### 1.  页面布局

#### 1.1  头部导航栏

> 使用 `Vant` 提供的 [NavBar 导航栏](https://youzan.github.io/vant/#/zh-CN/nav-bar) 组件，同时在 [NavBar 导航栏](https://youzan.github.io/vant/#/zh-CN/nav-bar) 组件标签中使用 [Button 按钮](https://youzan.github.io/vant/#/zh-CN/button) 组件，最后进行样式调整即可

1. 使用导航栏组件

2. 在导航栏组件中插入按钮

   - 文本
   - 图标

3. 样式调整

   - 宽高
   - 背景色
   - 边框
   - 文本大小
   - 图标大小

   

```html
<template>
  <div class="home-container">
    <!-- 顶部导航栏组件 -->
    <van-nav-bar class="page-nav-bar">
      <van-button class="search-btn" slot="title" type="info" size="small" round icon="search">搜索</van-button>
    </van-nav-bar>
  </div>
</template>

<script>
export default {
  name: 'HomeIndex'
}
</script>

<style scoped lang="less">
.home-container {
  /deep/ .van-nav-bar__title {
    max-width: unset;
  }
  .search-btn {
    width: 555px;
    height: 64px;
    background-color: #5babfb;
    border: none;
    font-size: 28px;
    .van-icon {
      font-size: 32px;
    }
  }
}
</style>

```





---





### 2. 处理文章频道列表

<img src="http://qiniu.pingyifan.com/uPic/002%20-%20%E9%A2%91%E9%81%93%E5%88%97%E8%A1%A8.png" style="zoom:67%;" />



#### 2.1 使用 Tab 标签页组件

> 使用 `Vant` 提供的 [Tab 标签页组件](https://youzan.github.io/vant/#/zh-CN/tab) 实现区域的开发



1. 分析 [Tab 标签页组件](https://youzan.github.io/vant/#/zh-CN/tab) 的滑动切换使用方式，并应用到页面中

   - 通过 `v-model` 绑定当前激活标签对应的索引值，默认情况下启用第一个标签
   - 通过 `animated` 属性可以开启切换标签内容时的转场动画
   - 通过 `swipeable` 属性可以开启滑动切换标签页

   ```vue
   <!-- 频道列表 -->
   <van-tabs v-model="active" swipeable>
     <van-tab title="标签 1">内容 1</van-tab>
     <van-tab title="标签 2">内容 2</van-tab>
     <van-tab title="标签 3">内容 3</van-tab>
     <van-tab title="标签 4">内容 4</van-tab>
     <van-tab title="标签 5">内容 5</van-tab>
     <van-tab title="标签 6">内容 6</van-tab>
   </van-tabs>
   ```

   ```js
   export default {
     name: 'HomeIndex',
     data() {
       return {
         active: 0
       }
     }
   }
   ```

   

2. 给组件添加 `animated`属性，开启切换标签内容时的转场动画

   ```vue
   <!-- 频道列表 -->
   <van-tabs v-model="active" swipeable animated>
     <!-- 略 -->
   </van-tabs>
   ```







#### 2.2 基础样式调整

1.  基础样式调整
    - 标签项
      + 右边框
      + 下边框
      + 宽高
      + 文字大小
      + 文字颜色
    - 底部条
      + 宽高
      + 颜色
      + 位置



2. 添加类名

   ```vue
   <van-tabs class="channel-tabs" v-model="active" swipeable animated>
     <!-- 略 -->
   </van-tabs>
   ```

   

3. 样式调整

   ```less
   /deep/ .channel-tabs {
     .van-tabs__wrap {
       height: 82px;
     }
   
     .van-tab {
       min-width: 200px;
       border-right: 1px solid #edeff3;
       font-size: 30px;
       color: #777777;
     }
   
     .van-tab--active {
       color: #333333;
     }
   
     .van-tabs__nav {
       padding-bottom: 0;
     }
   
     .van-tabs__line {
       bottom: 8px;
       width: 31px !important;
       height: 6px;
       background-color: #3296fa;
     }
   }
   ```

   

#### 2.3 处理汉堡按钮

1. 汉堡菜单样式调整

   - 使用插槽插入内容

   - 样式调整

     - 定位
     - 内容居中
     - 宽高
     - 背景色、透明度
     - 字体图标大小

   - 使用伪元素设置渐变边框

     + 定位
     + 宽高
     + 背景图
     + 背景图填充模式

     

2. 使用插槽插入内容

   ```vue
   <!-- 频道列表 -->
   <van-tabs class="channel-tabs" v-model="active" swipeable animated>
     <van-tab title="标签 1">内容 1</van-tab>
     <van-tab title="标签 2">内容 2</van-tab>
     <van-tab title="标签 3">内容 3</van-tab>
     <van-tab title="标签 4">内容 4</van-tab>
     <van-tab title="标签 5">内容 5</van-tab>
     <van-tab title="标签 6">内容 6</van-tab>
   
     <!-- 汉堡按钮 -->
     <div slot="nav-right" class="hamburger-btn">
       <i class="toutiao toutiao-gengduo"></i>
     </div>
   </van-tabs>
   ```

   

3. 样式调整

   ```less
   .hamburger-btn {
     position: fixed;
     right: 0;
     display: flex;
     justify-content: center;
     align-items: center;
     width: 66px;
     height: 82px;
     background-color: #fff;
     opacity: 0.902;
   
     i.toutiao {
       font-size: 33px;
     }
   }
   ```

   

4. 使用伪元素设置渐变边框

   ```less
   .hamburger-btn {
     position: fixed;
     right: 0;
     display: flex;
     justify-content: center;
     align-items: center;
     width: 66px;
     height: 82px;
     background-color: #fff;
     opacity: 0.902;
   
     i.toutiao {
       font-size: 33px;
     }
   
     &:before {
       content: '';
       position: absolute;
       left: 0;
       width: 1px;
       height: 100%;
       background-image: url(~@/assets/gradient-gray-line.png);
       background-size: contain;
     }
   }
   ```

   

5. 添加占位符充当内容区域，解决最后一个标签被覆盖遮挡的问题

   ```vue
   <!-- 频道列表 -->
   <van-tabs class="channel-tabs" v-model="active" swipeable animated>
     <van-tab title="标签 1">内容 1</van-tab>
     <van-tab title="标签 2">内容 2</van-tab>
     <van-tab title="标签 3">内容 3</van-tab>
     <van-tab title="标签 4">内容 4</van-tab>
     <van-tab title="标签 5">内容 5</van-tab>
     <van-tab title="标签 6">内容 6</van-tab>
   
     <!-- 汉堡按钮 -->
     <div slot="nav-right" class="placeholder"></div>
     <div slot="nav-right" class="hamburger-btn">
       <i class="toutiao toutiao-gengduo"></i>
     </div>
   </van-tabs>
   ```

   ```less
   .placeholder {
     flex-shrink: 0;
     width: 66px;
     height: 82px;
   }
   ```

   

6. 完整代码

   ```less
   .placeholder {
     flex-shrink: 0;
     width: 66px;
     height: 82px;
   }
   
   .hamburger-btn {
     position: fixed;
     right: 0;
     display: flex;
     justify-content: center;
     align-items: center;
     width: 66px;
     height: 82px;
     background-color: #fff;
     opacity: 0.902;
   
     i.toutiao {
       font-size: 33px;
     }
   
     &:before {
       content: '';
       position: absolute;
       left: 0;
       width: 1px;
       height: 100%;
       background-image: url(~@/assets/gradient-gray-line.png);
       background-size: contain;
     }
   }
   ```

   



---





### 3. 展示频道列表

#### 3.1  实现思路

1. 找数据接口
2. 把接口封装为请求方法
3. 在组件中请求获取数据
4. 模板绑定



#### 3.2 实现步骤

1. 在 `src\api\user.js` 中封装数据请求接口

   ```js
   // 获取用户自己的信息
   export const getUserChannels = () => {
     return request({
       method: 'GET',
       url: '/app/v1_0/user/channels'
     })
   }
   ```

   

2. 在 `src\views\home\index.vue` 导入封装的 `getUserChannels` 方法

   ```js
   import { getUserChannels } from '@/api/user'
   ```

   

3. 调用`getUserChannels`  方法获取到频道列表的数据

   ```js
   export default {
     name: 'HomeIndex',
     data() {
       return {
         active: 0,
         channels: [] // 频道列表
       }
     },
     created() {
       this.loadChannels()
     },
     methods: {
       async loadChannels() {
         try {
           const { data } = await getUserChannels()
           this.channels = data.data.channels
         } catch (err) {
           this.$toast('获取频道数据失败')
         }
       }
     }
   }
   ```

   

4. 模板绑定，渲染请求回来的数据

   ```vue
   <!-- 频道列表 -->
   <van-tabs class="channel-tabs" v-model="active" swipeable animated>
     <van-tab :title="channel.name" v-for="channel in channels" :key="channel.id">{{ channel.name }}的内容</van-tab>
   
     <!-- 汉堡按钮 -->
     <div slot="nav-right" class="placeholder"></div>
     <div slot="nav-right" class="hamburger-btn">
       <i class="toutiao toutiao-gengduo"></i>
     </div>
   </van-tabs>
   ```

   



### 4. 展示文章列表

<img src="http://qiniu.pingyifan.com/uPic/003%20-%20%E6%96%87%E7%AB%A0%E5%88%97%E8%A1%A8.png" style="zoom:67%;" />



#### 4.1 思路分析

##### 4.1.1 实现思路



你的思路可能是这样的：

1、找到数据接口

2、封装请求方法

3、在组件中请求获取数据，将数据存储到 data 中

4、模板绑定展示



根据不同的频道加载不同的文章列表，你的思路可能是这样的：

- 有一个 `list` 数组，用来存储文章列表
- 查看 `a` 频道：请求获取数据，让 `list = a` 频道文章
- 查看 `b` 频道：请求获取数据，让 `list = b` 频道文章
- 查看 `c` 频道：请求获取数据，让 `list = c` 频道文章
- ...

<img src="http://qiniu.pingyifan.com/uPic/004%20-%20%E6%96%87%E7%AB%A0%E5%88%97%E8%A1%A8.png" alt="image-20200111124415227" style="zoom: 60%;" />



思路没有问题，但是并不是我们想要的效果。

我们想要的效果是：**加载过的数据列表不要重新加载**。



```js
list: [
    a: [{}, {}],
    b: [{}, {}]
]
```





实现思路也非常简单，就是我们准备**多个 list 数组，每个频道对应一个，查看哪个频道就把数据往哪个频道的列表数组中存放，这样的话就不会导致覆盖问题**。

<img src="http://qiniu.pingyifan.com/uPic/005%20-%20%E6%96%87%E7%AB%A0%E5%88%97%E8%A1%A8.png" alt="image-20200111124530323" style="zoom:60%;" />



可是有多少频道就得有多少频道文章数组，我们都一个一个声明的话会非常麻烦，所以这里的建议是利用组件来处理。

具体做法就是：

- 封装一个文章列表组件
- 然后在频道列表中把文章列表遍历出来

**因为文章列表组件中请求获取文章列表数据需要频道 id，所以 频道 id 应该作为 props 参数传递给文章列表组件，为了方便，我们直接把频道对象传递给文章列表组件就可以了。**

<img src="http://qiniu.pingyifan.com/uPic/image-20200306155328108.png" style="zoom:67%;" />



在文章列表中请求获取对应的列表数据，展示到列表中。

最后把组件在频道列表中遍历出来，就像下面这样。


<img src="http://qiniu.pingyifan.com/uPic/image-20200306154805522.png" style="zoom:67%;" />





##### 4.1.2 实现步骤

1. 创建 `src/views/home/components/article-list.vue`

   ```vue
   <template>
     <div class="article-list">文章列表</div>
   </template>
   
   <script>
   export default {
     name: 'ArticleList'
   }
   </script>
   
   <style scoped lang="less"></style>
   
   ```

   

2. 在 `home/index.vue` 中注册并使用 `article-list.vue` 组件

   ```vue
   <template>
     <div class="home-container">
       <!-- 顶部导航栏组件 -->
       <!-- 代码略 -->
   
       <!-- 频道列表 -->
       <van-tabs class="channel-tabs" v-model="active" swipeable animated>
         <van-tab :title="channel.name" v-for="channel in channels" :key="channel.id">
   
           <!-- 文章列表 -->
           <article-list ref="article-list" :channel="channel" />
   
         </van-tab>
   
         <!-- 汉堡按钮 -->
         <!-- 代码略 -->
       </van-tabs>
     </div>
   </template>
   
   <script>
   import { getUserChannels } from '@/api/user'
   import ArticleList from './components/article-list'
   
   export default {
     name: 'HomeIndex',
     components: {
       ArticleList
     }
     // 其他节点略
   }
   </script>
   
   
   ```

   

3. 在 `article-list.vue` 组件内部使用 `props` 接收到父组件传递的数据

   ```vue
   <template>
     <div class="article-list">文章列表</div>
   </template>
   
   <script>
   export default {
     name: 'ArticleList',
     props: {
       channel: {
         type: Object,
         required: true
       }
     }
   }
   </script>
   
   <style scoped lang="less"></style>
   
   ```



4.  测试代码是否完成

   

5. **答疑**：

   - 为什么标签内容是懒渲染的？
     - 因为这是 Tab 标签页组件本身支持的默认功能，如果不需要可以通过配置 `:lazy-render="false"` 来关闭这个效果。





---





#### 4.2   使用 List 列表组件

> 使用 `Vant` 组件的[List 列表组件](https://youzan.github.io/vant/#/zh-CN/list) 完成页面的渲染工作



##### 4.2.1  `List` 列表组件介绍



[List 列表组件](https://youzan.github.io/vant/#/zh-CN/list)：瀑布流滚动加载，用于展示长列表。

1.  `List` 组件通过 `loading` 和 `finished` 两个变量控制加载状态
2.  当组件初始化或滚动到到底部时，会触发 load 事件并将 `loading` 设置成 `true`，此时可以发起异步操作并更新数据，数据更新完毕后，将 `loading` 设置成 `false` 即可，若数据已全部加载完毕，则直接将 `finished` 设置成 `true` 即可。
3.  `load` 事件
    + List 初始化后会触发一次 load 事件，用于加载第一屏的数据。
    + 如果一次请求加载的数据条数较少，导致列表内容无法铺满当前屏幕，List 会继续触发 load 事件，直到内容铺满屏幕或数据全部加载完成。
4.  `loading 属性`：控制加载中的 loading 状态
    + 非加载中，loading 为 false，此时会根据列表滚动位置判断是否触发 load 事件（列表内容不足一屏幕时，会直接触发）
    + 加载中，loading 为 true，表示正在发送异步请求，此时不会触发 load 事件
5.  `finished 属性`：控制加载结束的状态
    + 在每次请求完毕后，需要手动将 finished 设置为 false，表示本次加载结束
    + 所有数据加载结束，finished 为 true，此时不会触发 load 事件





##### 4.2.2 使用 `List` 组件列表

1. 初步使用 `List` 组件，并分析属性的含义

   ```vue
   <template>
     <div class="article-list">
       <van-list
         v-model="loading"
         :finished="finished"
         finished-text="没有更多了"
         @load="onLoad"
       >
         <van-cell v-for="item in list" :key="item" :title="item" />
       </van-list>
     </div>
   </template>
   
   <script>
   export default {
     name: 'ArticleList',
     props: {
       channel: {
         type: Object,
         required: true
       }
     },
     data () {
       return {
         list: [], // 存储列表数据的数组
         loading: false, // 控制加载中 loading 状态
         finished: false // 控制数据加载结束的状态
       }
     },
     methods: {
       // 初始化或滚动到底部的时候会触发调用 onLoad
       onLoad () {
         console.log('onLoad')
         // 1. 请求获取数据
         // setTimeout 仅做示例，真实场景中一般为 ajax 请求
         setTimeout(() => {
           // 2. 把请求结果数据放到 list 数组中
           for (let i = 0; i < 10; i++) {
             // 0 + 1 = 1
             // 1 + 1 = 2
             // 2 + 1 = 3
             this.list.push(this.list.length + 1)
           }
   
           // 3. 本次数据加载结束之后要把加载状态设置为结束
           //     loading 关闭以后才能触发下一次的加载更多
           this.loading = false
   
           // 4. 判断数据是否全部加载完成
           if (this.list.length >= 40) {
             // 如果没有数据了，把 finished 设置为 true，之后不再触发加载更多
             this.finished = true
           }
         }, 1000)
       }
     }
   }
   </script>
   
   <style scoped lang="less"></style>
   
   ```

   

2. 加载到底部以后数据提示可能看不到，需要在 `src\views\home\index.vue` 设置 `home-container` 样式进行设置

   ```less
   .home-container {
     padding-bottom: 100px;
   }
   ```

   

   

----



#### 4.3.  加载文章列表数据

##### 4.3.1 实现思路

1. 实现思路
   - 找到数据接口
   - 封装请求方法
   - 请求获取数据
   - 模板绑定



##### 4.3.2 实现步骤

> 注意：使用接口文档中最下面的 **频道新闻推荐 `/V1_1`**

1. 创建 `src/api/article.js` 封装获取文章列表数据的接口 `getArticles` 

   ```js
   /**
    * 文章接口模块
    */
   
   import request from '@/utils/request'
   
   // 获取频道的文章列表
   export const getArticles = params => {
     return request({
       method: 'GET',
       url: '/app/v1_1/articles',
       params
     })
   }
   ```

   

2. 在 `article-list.vue` 中导入 `getArticles` 方法

   ```js
   import { getArticles } from '@/api/article'
   ```

   

3. 在 `onload` 方法使用 `getArticles` 方法

   - 往方法中传入即可文档需要的参数
   - 获取到文章列表的数据

   ```js
   methods: {
     // 当触发上拉加载更多的时候调用该函数
     async onLoad() {
       try {
         const { data } = await getArticles({
           channel_id: this.channel.id, // 频道 id
           timestamp: this.timestamp || Date.now(), // 时间戳，请求新的推荐数据传当前的时间戳，请求历史推荐传指定的时间戳
           with_top: 1 // 是否包含置顶，进入页面第一次请求时要包含置顶文章，1-包含置顶，0-不包含
         })
   
         console.log(data)
       } catch (err) {
         console.log(err)
       }
     }
   }
   ```

   

##### 4.3.3 处理响应数据

1. 处理响应的数据结果

   ```js
   data () {
     return {
       list: [], // 文章列表数据
       loading: false, // 上拉加载更多的 loading 状态
       finished: false, // 是否加载结束
       error: false, // 是否加载失败
       timestamp: null // 请求下一页数据的时间戳
     }
   },
   methods: {
       // 当触发上拉加载更多的时候调用该函数
       async onLoad () {
         try {
           // 1. 请求获取数据
           const { data } = await getArticles({
             channel_id: this.channel.id, // 频道 id
             timestamp: this.timestamp || Date.now(), // 时间戳，请求新的推荐数据传当前的时间戳，请求历史推荐传指定的时间戳
             with_top: 1 // 是否包含置顶，进入页面第一次请求时要包含置顶文章，1-包含置顶，0-不包含
           })
   
           // 2. 把数据添加到 list 数组中
           const { results } = data.data
           this.list.push(...results)
   
           // 3. 设置本次加载中 loading 状态结束
           this.loading = false
   
           // 4. 判断数据是否加载结束
           if (results.length) {
             // 更新获取下一页数据的时间戳
             this.timestamp = data.data.pre_timestamp
           } else {
             // 没有数据了，设置加载状态结束，不再触发上拉加载更多了
             this.finished = true
           }
         } catch (err) {
           console.log(err)
         }
       }
     }
   }
   ```

   

2. 渲染页面

   ```vue
   <template>
     <div class="article-list">
       <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
         <van-cell v-for="(article, index) in list" :key="index" :title="article.title" />
       </van-list>
     </div>
   </template>
   ```

   

3. 返回页面查看渲染结果





##### 4.4.4 错误结果的处理

> 错误处理的提示参考 [List 列表](https://youzan.github.io/vant/#/zh-CN/list) 组件错误提示用法



1. 若列表数据加载失败，将`error`设置成`true`即可显示错误提示，用户点击错误提示后会重新触发 load 事件

   - 给 `List` 组件添加 `error.sync` 属性，表示是否加载失败
   - 给 `List` 组件添加 `error-text` 属性，代表加载失败后的提示文案

   ```vue
   <van-list
     v-model="loading"
     :finished="finished"
     finished-text="没有更多了"
     :error.sync="error"
     error-text="请求失败，点击重新加载"
     @load="onLoad"
   >
     <van-cell v-for="(article, index) in list" :key="index" :title="article.title" />
   </van-list>
   ```

   

2. 在 `data` 中声明 `error` 属性

   ```js
   data() {
     return {
       list: [], // 存储列表数据的数组
       loading: false, // 控制加载中 loading 状态
       finished: false, // 控制数据加载结束的状态
       error: false // 控制列表加载失败的提示状态
     }
   }
   ```

   

3. 在请求错误以后将 `error` 设置为 `true` 开启提示，同时将 `loading` 也进行关闭

   ```js
   methods: {
       // 当触发上拉加载更多的时候调用该函数
       async onLoad () {
         try {
             
           // 请求成功的逻辑略……
           
         } catch (err) {
           this.loading = false // 关闭 loading 效果
           this.error = true // 开启错误提示
         }
       }
     }
   }
   ```






---





#### 4.4.  下拉刷新

> 这里主要使用到 `Vant` 中的 [PullRefresh 下拉刷新](https://youzan.github.io/vant/#/zh-CN/pull-refresh) 组件



<img src="http://qiniu.pingyifan.com/uPic/006%20-%20%E5%B1%95%E7%A4%BA%E6%96%87%E7%AB%A0%E5%88%97%E8%A1%A8-%E4%B8%8B%E6%8B%89%E5%88%B7%E6%96%B0.gif" style="zoom:70%;" />





##### 4.4.1 实现思路

1. 注册下拉刷新事件（组件）的处理函数
2. 发送请求获取文章列表数据
3. 把获取到的数据添加到当前频道的文章列表的顶部
4. 提示用户刷新成功



##### 4.4.2 实现步骤

1. 使用 `PullRefresh 下拉刷新` 组件将需要下拉刷新的组件进行包裹

   - 复制 `PullRefresh 下拉刷新` 组件标签，在 `src\views\home\components\article-list.vue` 组件中对 `van-list` 包裹
   - 声明组件标签中需要的属性 `v-model` 和 `refresh ` 事件

   ```vue
   <van-pull-refresh v-model="isreFreshLoading" @refresh="onRefresh">
     <van-list
       v-model="loading"
       :finished="finished"
       finished-text="没有更多了"
       :error.sync="error"
       error-text="请求失败，点击重新加载"
       @load="onLoad"
     >
       <van-cell v-for="(article, index) in list" :key="index" :title="article.title" />
     </van-list>
   </van-pull-refresh>
   ```

   ```js
   data() {
     return {
       isreFreshLoading: false // 控制下拉刷新的 loading 状态
     }
   }
   ```

   ```js
   methods: {
     // 当下拉刷新的时候会触发调用该函数
     onRefresh() {
       console.log('onRefresh')
     }
   }
   ```

   

2. 在 `refresh` 事件中，发起请求，获取下拉刷新的数据，同时下拉刷新的 `loading` 状态

   ```js
   // 当下拉刷新的时候会触发调用该函数
   async onRefresh() {
     try {
       // 请求获取数据
       // 1. 请求获取数据
       const { data } = await getArticles({
         channel_id: this.channel.id, // 频道 id
         timestamp: Date.now(), // 下拉刷新，每次请求获取最新数据，所以传递当前最新时间戳
         with_top: 1 // 是否包含置顶，进入页面第一次请求时要包含置顶文章，1-包含置顶，0-不包含
       })
   
       // 2. 将数据追加到列表的顶部
       const { results } = data.data
       this.list.unshift(...results)
   
       // 3. 关闭下拉刷新的 loading 状态
       this.isreFreshLoading = false
   
     } catch (error) {
       this.isreFreshLoading = false
     }
   }
   ```

   

3. 对下拉刷新细节进行优化，添加成功提示属性 `success-text`，以及刷新成功提示展示时长属性 `success-duration`

   ```vue
   <van-pull-refresh
     v-model="isreFreshLoading"
     @refresh="onRefresh"
     :success-text="refreshSuccessText"
     :success-duration="1500"
   >
     <!-- 略 -->
   </van-pull-refresh>
   ```

   ```js
   data() {
     return {
       refreshSuccessText: '刷新成功' // 下拉刷新成功提示文本
     }
   }
   ```

   ```js
   async onRefresh() {
     try {
       // 请求获取数据
       // 1. 请求获取数据
   	// 略……
       // 2. 将数据追加到列表的顶部
   	// 略……
       // 3. 关闭下拉刷新的 loading 状态
   	// 略……
         
       // 更新下拉刷新成功提示的文本
       this.refreshSuccessText = `刷新成功，更新了${results.length}条数据`
   
     } catch (error) {
       this.refreshSuccessText = '刷新失败'
       this.isreFreshLoading = false
     }
   }
   ```





### 5.  优化文章列表

#### 5.1   固定头部和频道列表

1. 在 `src\views\home\index.vue` 中，给 `van-nav-bar` 导航栏添加 `fixed` 属性，实现导航栏固定

   ```vue
   <!-- 顶部导航栏组件 -->
   <van-nav-bar class="page-nav-bar" fixed>
     <van-button class="search-btn" slot="title" type="info" size="small" round icon="search">搜索</van-button>
   </van-nav-bar>
   ```

   

2. 导航栏固定以后，发现 `Tab` 标签栏被覆盖，使用样式进行调整

   ```less
   /deep/ .channel-tabs {
     .van-tabs__wrap {
       position: fixed;
       top: 92px;
       z-index: 1;
       left: 0;
       right: 0;
       height: 82px;
     }
   ```

   

3. `Tab` 标签栏被覆盖问题解决以后，发现列表前两个被遮盖，给 `home-container` 添加样式进行调整

   ```less
   .home-container {
     padding-top: 174px;
   }
   ```

   

#### 5.2 记住列表的滚动位置

##### 5.2.1 思路分析

1. 为什么列表滚动会相互影响 ？

   - 因为他们并不是再自己内部滚动，而是整个 `body` 页面在滚动，无论你是在 `a` 频道还是在 `b` 频道，其实滚动的都是 `body` 元素

   

2. 如何快速找到是哪个元素产生的滚动

   - 使用下面的代码粘贴到调试工具中运行一下，然后滚动页面，就可以看到是哪个元素产生的滚动了

   ```js
   function findscroller(element) {
     element.onscroll = function () {
       console.log(element)
     }
     Array.from(element.children).forEach(findscroller)
   }
   findscroller(document.body)
   ```





##### 5.2.2  怎么记住列表的滚动位置

1. 让每一个标签内容文章列表产生自己的滚动容器，这样就不会相互影响了

2. 如何让标签内容文章列表产生自己的滚动容器？

   - 固定高度： `height: xxx;`
   - 溢出滚动：`overflow-y: auto;`

3. 我们给文章列表组件的根节点样式设置如下，

   ```less
   <style scoped lang="less">
   .article-list {
     height: 100%;
     overflow-y: auto;
   }
   </style>
   ```

   

4. 但是发现设置高 `100%` 的话没有作用，这是为什么？

   - 因为百分比是相对于父元素，而我们通过审查元素发现它所有的父元素都没有高
   - 那肯定没有作用了

   

5. `css3` 中新增了一种视口单位 `vw` 和 `vh` ，何谓视口，就是根据你浏览器窗口的大小的单位，不受父元素的影响

   - **在移动端，视口单位相对于布局视口**
   - `1vw` = 可视窗口宽度的百分之一，比如窗口宽度是 `750`，则 `1vw` = `7.5px`
   - `1vh` = 可视窗口高度的百分之一，比如窗口宽度是 `667`，则 `1vw` =  `6.67px`
   - 使用它唯一需要注意的就是它的兼容性：
     - 在 `PC` 端已兼容到 `IE6`
     - 在移动端 `IOS8` 以上以及 `Android 4.4 `以上获得支持，并且在微信 `x5` 内核中也得到了完美的全面支持
     - `Vue`本身就已经兼容到 `IE9`，所以可以使用这个视口单位

   ```less
   <style scoped lang="less">
   .article-list {
     height: 79vh;
     overflow-y: auto;
   }
   </style>
   ```





---





### 6. 文章列表项

#### 6.1 准备组件

1. 在我们项目中有好几个页面中都有这个文章列表项内容，如果我们在每个页面中都写一次的话不仅效率低而且维护起来也麻烦。
   所以最好的办法就是我们把它封装为一个组件，然后在需要使用的组件中加载使用即可

2. 创建 `src/components/article-item/index.vue` 组件

   ```vue
   <template>
     <div class="article-item">文章列表项</div>
   </template>
   
   <script>
   export default {
     name: 'ArticleItem',
     props: {
       article: {
         type: Object,
         required: true
       }
     }
   }
   </script>
   
   <style lang="less" scoped>
   </style>
   
   ```

   

3. 在文章列表组件中注册使用文章列表项组件

   ```js
   <script>
   import { getArticles } from '@/api/article'
   import ArticleItem from '@/components/article-item'
   
   export default {
     name: 'ArticleList',
     components: {
       ArticleItem
     }
   }
   </script>
   ```

   ```vue
   <van-list
     v-model="loading"
     :finished="finished"
     finished-text="没有更多了"
     :error.sync="error"
     error-text="请求失败，点击重新加载"
     @load="onLoad"
   >
     <article-item v-for="(article, index) in list" :key="index" :article="article"></article-item>
   </van-list>
   ```

   



2、

<img src="assets/image-20200404224728524.png" alt="image-20200404224728524" style="zoom:50%;" />





#### 6.2 展示列表项内容

>  使用 `Vant` 提供的 [Cell 单元格组件](https://youzan.github.io/vant/#/zh-CN/cell) 完成列表项内容的开发，展示标题以及底部信息



1. 使用 `cell` 单元格组件以及 `image` 组件完成页面功能的开发 

   ```vue
   <template>
     <div class="article-item">
       <van-cell class="article-item">
         <div slot="title" class="title">{{ article.title }}</div>
         <div slot="label">
           <div v-if="article.cover.type === 3" class="cover-wrap">
             <div class="cover-item" v-for="(img, index) in article.cover.images" :key="index">
               <van-image width="100" height="100" :src="img" />
             </div>
           </div>
           <div>
             <span>{{ article.aut_name }}</span>
             <span>{{ article.comm_count }}评论</span>
             <span>{{ article.pubdate }}</span>
           </div>
         </div>
         <van-image
           v-if="article.cover.type === 1"
           slot="default"
           width="100"
           height="100"
           :src="article.cover.images[0]"
         />
       </van-cell>
     </div>
   </template>
   
   <script>
   export default {
     name: 'ArticleItem',
     props: {
       article: {
         type: Object,
         required: true
       }
     }
   }
   </script>
   
   <style lang="less" scoped>
   </style>
   
   ```

   



#### 6.3 样式调整

1. 文章标题
   + 字号
   + 颜色
   + 多行文字省略
2. 单图封面
   + 封面容器
     * 去除 flex: 1，固定宽高
     * 左内边距
   + 封面图
     * 宽高
     * 填充模式：cover
3. 底部文本信息
   + 字号
   + 颜色
   + 间距
4. 多图封面
   + 外层容器
     * flex 容器
     * 上下外边距
   + 图片容器
     * 平均分配容器空间：flex: 1;
     * 固定高度
     * 容器项间距
   + 图片
     * 宽高
     * 填充模式



5. 完成列表项代码的样式布局

   ```vue
   <template>
     <van-cell class="article-item">
       <div slot="title" class="title van-multi-ellipsis--l2">{{ article.title }}</div>
       <div slot="label">
         <div v-if="article.cover.type === 3" class="cover-wrap">
           <div class="cover-item" v-for="(img, index) in article.cover.images" :key="index">
             <van-image class="cover-item-img" fit="cover" :src="img" />
           </div>
         </div>
         <div class="label-info-wrap">
           <span>{{ article.aut_name }}</span>
           <span>{{ article.comm_count }}评论</span>
           <span>{{ article.pubdate }}</span>
         </div>
       </div>
       <van-image
         v-if="article.cover.type === 1"
         slot="default"
         class="right-cover"
         fit="cover"
         :src="article.cover.images[0]"
       />
     </van-cell>
   </template>
   
   <script>
   export default {
     name: 'ArticleItem',
     props: {
       article: {
         type: Object,
         required: true
       }
     }
   }
   </script>
   
   <style scoped lang="less">
   .article-item {
     .title {
       font-size: 32px;
       color: #3a3a3a;
     }
   
     .van-cell__value {
       flex: unset;
       width: 232px;
       height: 146px;
       padding-left: 25px;
     }
   
     .right-cover {
       width: 232px;
       height: 146px;
     }
   
     .label-info-wrap span {
       font-size: 22px;
       color: #b4b4b4;
       margin-right: 25px;
     }
   
     .cover-wrap {
       display: flex;
       padding: 30px 0;
       .cover-item {
         flex: 1;
         height: 146px;
         &:not(:last-child) {
           padding-right: 4px;
         }
         .cover-item-img {
           width: 100%;
           height: 146px;
         }
       }
     }
   }
   </style>
   
   ```

   



#### 6.4 关于第三方图片资源403问题

1. 为什么文章列表数据中的好多图片资源请求失败返回 403？

   - 这是因为我们项目的接口数据是后端通过爬虫抓取的第三方平台内容，而第三方平台对图片资源做了防盗链保护处理

   

2. 第三方平台怎么处理图片资源保护的？

   - 服务端一般使用 `Referer` 请求头识别访问来源，然后处理资源访问

     <img src="http://qiniu.pingyifan.com/uPic/007%20-%20%E5%85%B3%E4%BA%8E%E7%AC%AC%E4%B8%89%E6%96%B9%E5%9B%BE%E7%89%87%E8%B5%84%E6%BA%90403%E9%97%AE%E9%A2%98.png" style="zoom:80%;" />

   

3. `Referer` 是什么东西？

   > 扩展参考：http://www.ruanyifeng.com/blog/2019/06/http-referer.html
   >
   > 注意: `referer` 实际上是 `referrer` 误拼写。参见 [HTTP referer on Wikipedia](https://zh.wikipedia.org/wiki/HTTP_referer) （`HTTP referer` 在维基百科上的条目）来获取更详细的信息。

   

   - `Referer` 是 `HTTP` 请求头的一部分，当浏览器向 `Web` 服务器发送请求的时候，一般会带上 `Referer`，它包含了当前请求资源的来源页面的地址。服务端一般使用 `Referer` 请求头识别访问来源，可能会以此进行统计分析、日志记录以及缓存优化等

   

4. 怎么解决

   - 不要发送 `referrer` ，对方服务端就不知道你从哪来的了，姑且认为是你是自己人吧

     

5. 如何设置不发送 `referrer`？

   - 用 `<a>`、`<area>`、`<img>`、`<iframe>`、`<script>` 或者 `<link>` 元素上的 `referrerpolicy` 属性为其设置独立的请求策略，例如：

   ```vue
   <img src="http://……" referrerPolicy="no-referrer">
   ```

   

   - 或者直接在 `HTMl` 页面头中通过 `meta` 属性全局配置：

   ```vue
   <meta name="referrer" content="no-referrer" />
   ```

   



#### 6.5  处理相对时间

1. 推荐两个第三方库：

   - [Moment.js](https://momentjs.com/)
   - [Day.js](https://day.js.org/)

   

   两者都是专门用于处理时间的 `JavaScript` 库，功能差不多，因为 `Day.js` 的设计就是参考的 `Moment.js`。但是 `Day.js` 相比 `Moment.js` 的包体积要更小一些，因为它采用了插件化的处理方式。

   [Day.js](https://day.js.org/zh-CN/) 是一个轻量的处理时间和日期的 JavaScript 库，和 [Moment.js](https://momentjs.com/) 的 `API` 设计保持完全一样，如果您曾经用过 `Moment.js`, 那么您已经知道如何使用 `Day.js` 。

   - `Day.js`可以运行在浏览器和 `Node.js` 中。
   - 🕒 和 `Moment.js` 相同的 `API` 和用法
   - 💪 不可变数据 (`Immutable`)
   - 🔥 支持链式操作 (`Chainable)`
   - 🌐 国际化 `I18n`
   - 📦 仅 `2kb` 大小的微型库
   - 👫 全浏览器兼容

   

2. 安装

   ```shell
   npm i dayjs
   ```

   

3. 创建 `utils/dayjs.js`

   ```js
   import Vue from 'vue'
   import dayjs from 'dayjs'
   
   // 加载中文语言包
   import 'dayjs/locale/zh-cn'
   
   import relativeTime from 'dayjs/plugin/relativeTime'
   
   // 配置使用处理相对时间的插件
   dayjs.extend(relativeTime)
   
   // 配置使用中文语言包
   dayjs.locale('zh-cn')
   
   // 全局过滤器：处理相对时间
   Vue.filter('relativeTime', value => {
     return dayjs().to(dayjs(value))
   })
   
   ```

   

4. 在 `main.js` 中加载初始化

   ```js
   import './utils/dayjs'
   ```

   

5. 使用过滤器

   ```js
   <p>{{ 日期数据 | relativeTime }}</p>
   ```



