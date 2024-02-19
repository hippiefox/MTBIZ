//
//  MTFileType.swift
//  MTBIZ
//
//  Created by pulei yu on 2024/2/19.
//

import Foundation

public enum MTFileType: String {
    case folder
    case video
    case audio
    case image
    case txt
    case other
    
    public static let videos: [String] = ["mp4", "MP4", "avi", "AVI", "wmv", "WMV", "asf", "ASF", "asx", "ASX", "rm", "RM", "rM", "Rm", "rmvb", "RMVB", "mpg", "MPG", "mpeg", "MPEG", "mpe", "MPE", "3gp", "3GP", "mov", "MOV", "m4v", "M4V", "dat", "DAT", "mkv", "MKV", "flv", "FLV", "vob", "VOB", "ts", "TS"]
    public static let txts: [String] = ["PDF", "pdf", "XLS", "xls", "XLSX", "xlsx", "ppt", "PPT", "pptx", "PPTX", "docx", "DOCX", "dox", "DOC", "doc", "TXT", "txt"]
    public static let audios: [String] = ["WMA", "wma", "FLAC", "flac", "APE", "ape", "WAV", "wav", "MP3", "mp3", "ogg", "OGG"]
    public static let images: [String] = ["jpg", "JPG", "jpeg", "JPEG", "png", "PNG", "heic", "HEIC"]
    
    public static func type(of fileName: String)-> MTFileType{
        let ext = (fileName as NSString).pathExtension
        if self.videos.contains(ext){
            return .video
        }
        if self.images.contains(ext){
            return .image
        }
        if txts.contains(ext){
            return .txt
        }
        if audios.contains(ext){
            return .audio
        }
        return .other
    }
}
