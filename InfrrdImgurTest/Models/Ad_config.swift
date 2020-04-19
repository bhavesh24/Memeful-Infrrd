/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Ad_config : Codable {
	let safeFlags : [String]?
	let highRiskFlags : [String]?
	let unsafeFlags : [String]?
	let wallUnsafeFlags : [String]?
	let showsAds : Bool?

	enum CodingKeys: String, CodingKey {

		case safeFlags = "safeFlags"
		case highRiskFlags = "highRiskFlags"
		case unsafeFlags = "unsafeFlags"
		case wallUnsafeFlags = "wallUnsafeFlags"
		case showsAds = "showsAds"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		safeFlags = try values.decodeIfPresent([String].self, forKey: .safeFlags)
		highRiskFlags = try values.decodeIfPresent([String].self, forKey: .highRiskFlags)
		unsafeFlags = try values.decodeIfPresent([String].self, forKey: .unsafeFlags)
		wallUnsafeFlags = try values.decodeIfPresent([String].self, forKey: .wallUnsafeFlags)
		showsAds = try values.decodeIfPresent(Bool.self, forKey: .showsAds)
	}

}