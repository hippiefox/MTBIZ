//
//  MTFile.swift
//  MTBIZ
//
//  Created by pulei yu on 2024/2/19.
//

import Foundation
import SwiftyJSON

open class MTFileModel: NSObject {
    /// 文件id
    open var file_id: String = ""
    /// 文件编号,文件列表中大概率不需要试用
    open var file_idx: String = ""
    /// 后端定义的文件类型
    open var fileOrFolder: MTFileFolderType = .regular
    /// 文件名
    open var file_name: String = ""
    /// 文件大小
    open var file_size: Int = 0
    /// 40位字符, 非BT文件,该值为空
    open var file_etag: String = ""
    /// 文件直接地址,非BT文件有值
    open var file_url: String = ""
    /// 文件所在上级路径
    open var parent_path: String = ""
    /// 创建日期
    open var create_time: String = ""
    /// 是否被收藏
    open var isFavored: Bool = false
    /// 是否可以删除
    open var isDeletable: Bool = true
    /// 是否可以编辑
    open var isModifiable: Bool = true

    /// 按项目需要进行override
    public init(json: JSON) {
        file_id = json["fid"].stringValue
        parent_path = json["pfid"].stringValue
        file_name = json["filename"].stringValue
        fileOrFolder = MTFileFolderType(rawValue: json["filetype"].stringValue) ?? .regular
        file_size = json["filesize"].intValue
        file_etag = json["fileetag"].stringValue
        create_time = json["update_time"].stringValue
        isModifiable = json["modifiable"].bool ?? true
        isDeletable = json["deletable"].bool ?? true
        file_idx = json["idx"].stringValue
        file_url = json["url"].stringValue
        isFavored = json["is_collection"].boolValue
    }
}

public extension MTFileModel {
    var _isBT: Bool { file_etag.count == 40 }
    var _fileExtension: String { (file_name as NSString).pathExtension }
    var _filePureName: String { (file_name as NSString).deletingPathExtension }
    var _fileType: MTFileType { MTFileType.type(of: file_name) }
}
