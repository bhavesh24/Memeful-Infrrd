/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Images : Codable {
	let id : String?
	let title : String?
	let description : String?
	let datetime : Int?
	let type : String?
	let animated : Bool?
	let width : Int?
	let height : Int?
	let size : Int?
	let views : Int?
	let bandwidth : Int?
	let vote : String?
	let favorite : Bool?
	let nsfw : String?
	let section : String?
	let account_url : String?
	let account_id : String?
	let is_ad : Bool?
	let in_most_viral : Bool?
	let has_sound : Bool?
	let tags : [String]?
	let ad_type : Int?
	let ad_url : String?
	let edited : String?
	let in_gallery : Bool?
	let link : String?
	let comment_count : String?
	let favorite_count : String?
	let ups : String?
	let downs : String?
	let points : String?
	let score : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case description = "description"
		case datetime = "datetime"
		case type = "type"
		case animated = "animated"
		case width = "width"
		case height = "height"
		case size = "size"
		case views = "views"
		case bandwidth = "bandwidth"
		case vote = "vote"
		case favorite = "favorite"
		case nsfw = "nsfw"
		case section = "section"
		case account_url = "account_url"
		case account_id = "account_id"
		case is_ad = "is_ad"
		case in_most_viral = "in_most_viral"
		case has_sound = "has_sound"
		case tags = "tags"
		case ad_type = "ad_type"
		case ad_url = "ad_url"
		case edited = "edited"
		case in_gallery = "in_gallery"
		case link = "link"
		case comment_count = "comment_count"
		case favorite_count = "favorite_count"
		case ups = "ups"
		case downs = "downs"
		case points = "points"
		case score = "score"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		datetime = try values.decodeIfPresent(Int.self, forKey: .datetime)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		animated = try values.decodeIfPresent(Bool.self, forKey: .animated)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		bandwidth = try values.decodeIfPresent(Int.self, forKey: .bandwidth)
		vote = try values.decodeIfPresent(String.self, forKey: .vote)
		favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
		nsfw = try values.decodeIfPresent(String.self, forKey: .nsfw)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		account_url = try values.decodeIfPresent(String.self, forKey: .account_url)
		account_id = try values.decodeIfPresent(String.self, forKey: .account_id)
		is_ad = try values.decodeIfPresent(Bool.self, forKey: .is_ad)
		in_most_viral = try values.decodeIfPresent(Bool.self, forKey: .in_most_viral)
		has_sound = try values.decodeIfPresent(Bool.self, forKey: .has_sound)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		ad_type = try values.decodeIfPresent(Int.self, forKey: .ad_type)
		ad_url = try values.decodeIfPresent(String.self, forKey: .ad_url)
		edited = try values.decodeIfPresent(String.self, forKey: .edited)
		in_gallery = try values.decodeIfPresent(Bool.self, forKey: .in_gallery)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		comment_count = try values.decodeIfPresent(String.self, forKey: .comment_count)
		favorite_count = try values.decodeIfPresent(String.self, forKey: .favorite_count)
		ups = try values.decodeIfPresent(String.self, forKey: .ups)
		downs = try values.decodeIfPresent(String.self, forKey: .downs)
		points = try values.decodeIfPresent(String.self, forKey: .points)
		score = try values.decodeIfPresent(String.self, forKey: .score)
	}

}