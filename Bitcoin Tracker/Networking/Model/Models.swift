//
//  Models.swift
//  Bitcoin Tracker
//
//  Created by Admin on 5/14/21.
//

import Foundation

/* let url = https://rest-sandbox.coinapi.io/v1/assets/?apikey=19FEF8C9-3B3C-47AC-A6D2-85F8154C8B7F
*/

/*{
    "asset_id": "USD",
    "name": "US Dollar",
    "type_is_crypto": 0,
    "data_start": "2010-07-17",
    "data_end": "2021-05-13",
    "data_quote_start": "2014-02-24T17:43:05.0000000Z",
    "data_quote_end": "2021-05-13T12:15:00.7200000Z",
    "data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
    "data_orderbook_end": "2020-08-05T14:38:00.7082850Z",
    "data_trade_start": "2010-07-17T23:09:17.0000000Z",
    "data_trade_end": "2021-05-13T12:15:04.6333333Z",
    "data_symbols_count": 57080,
    "volume_1hrs_usd": 23668516033003.42,
    "volume_1day_usd": 761203931414451.41,
    "volume_1mth_usd": 15579647071412704.17,
    "id_icon": "0a4185f2-1a03-4a7c-b866-ba7076d8c73b"
  }*/

struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}

struct Icon: Codable {
    let asset_id: String
    let url: String
}
