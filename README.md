# 存储模块详细设计

## 1. 概述
### 1.1 简介
存储模块以持久化的方式保存数据，并提供简单查询功能。  
本文档中涉及到的编程语言为Swift。  
### 1.2 术语
* K-V: Key-Value 键值对
* ORM: Object Relational Mapping 对象关系映射
* QYL: 启阳路缩写，做类名前缀，用来区分命名空间
## 2. 分析
### 2.1 需要存储的数据类型
| 数据类型 | 说明 |
| ---- | ---- |
| 基本类型 | 整型，浮点数，字符串，布尔型 |
| 容器 | 数组，字典|
注：容器内存放的数据类型只能是基本类型或容器
### 2.2 存储方式
| 存储方式 | 说明 |
| ---- | ---- |
| 文件 | 支持基本类型和容器。将所存储数据序列化，并保存到文件中，需要自行管理文件|
| UserDefaults | 支持基本类型，容器。K-V方式存取数据，不支持复杂查询 |
| 数据库 | 需要将数据转换为数据库对象或者SQL语句，支持复杂查询。应用较多为基于SQLite第三方库，如FMDB等。更多信息参考附录 |
| CoreData | 系统提供的持久化和缓存框架，支持SQLite作为持久化层。通过管理对象存取数据 |
| MMKV | 腾讯开源库，K-V方式存取数据，内存做缓存，以ProtoBuf写回文件。更多信息参考附录。|
### 2.3 性能
| 存储方式 | 说明 |
| ---- | ---- |
| 文件 | 性能瓶颈在磁盘IO，大量小文件的读写会导致性能低
| UserDefaults | 单文件存储，当数据量大时，读写性能下降 |
| 数据库 |性能待调研 |
| CoreData | 性能待调研 |
| MMKV | 内存做缓存，数据量小时性能较好，数据量大时需写回文件，导致性能下降。|
### 2.4 安全性
| 存储方式 | 是否线程安全 | 说明 |
| ---- | :----: | ---- |
| 文件 | ✘ | 非线程安全 |
| UserDefaults | ✔ | 线程安全 |
| 数据库 | - | 依赖第三方库的线程安全性，FMDB是线程安全的 |
| CoreData | ✘ | 非线程安全 |
| MMKV | ✔ | 线程安全 |
### 2.5 可维护性
| 存储方式 | 可维护性 |
| ---- | ---- |
| 文件 | 差 |
| UserDefaults | 好 |
| 数据库 | 依赖第三方库，FMDB 好 |
| CoreData | 好 |
| MMKV | 好 |
## 3. 存储方案
选择K-V方式存取数据，采取MMKV作为底层实现。
## 4. 数据结构和接口
```
// K-V存储管理单例
class QYLKeyValueStorage {
    // 读取数据
    func bool(_ key: String) -> Bool?
    func int(_ key: String) -> Int?
    func uint(_ key: String) -> UInt?
    func float(_ key: String) -> Float?
    func double(_ key: String) -> Double?
    func string(_ key: String) -> String?
    func array(_ key: String) -> [Any]?
    func dictionary(_ key: String) -> [String: Any]?

    // 设定数据
    func set(_ value: Bool, forKey: String)
    func set(_ value: Int, forKey: String)
    func set(_ value: UInt, forKey: String)
    func set(_ value: Float, forKey: String)
    func set(_ value: Double, forKey: String)
    func set(_ value: String, forKey: String)
    func set(_ value: [Any], forKey: String)
    func set(_ value: [String: Any], forKey: String)

    // 删除数据
    func remove(forKey: String)
}
```
## 5. 附录
### 5.1 FMDB
[FMDB开源项目](https://github.com/ccgus/fmdb)
### 5.2 MMKV
[MMKV开源项目](https://github.com/Tencent/MMKV)

  
