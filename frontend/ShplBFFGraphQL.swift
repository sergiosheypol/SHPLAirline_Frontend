// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct FarefinderDto: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - departureDateFrom
  ///   - departureDateTo
  ///   - arrivalAirport
  ///   - departureAirport
  ///   - currencyCode
  public init(departureDateFrom: Swift.Optional<String?> = nil, departureDateTo: Swift.Optional<String?> = nil, arrivalAirport: Swift.Optional<String?> = nil, departureAirport: Swift.Optional<String?> = nil, currencyCode: Swift.Optional<String?> = nil) {
    graphQLMap = ["departureDateFrom": departureDateFrom, "departureDateTo": departureDateTo, "arrivalAirport": arrivalAirport, "departureAirport": departureAirport, "currencyCode": currencyCode]
  }

  public var departureDateFrom: Swift.Optional<String?> {
    get {
      return graphQLMap["departureDateFrom"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "departureDateFrom")
    }
  }

  public var departureDateTo: Swift.Optional<String?> {
    get {
      return graphQLMap["departureDateTo"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "departureDateTo")
    }
  }

  public var arrivalAirport: Swift.Optional<String?> {
    get {
      return graphQLMap["arrivalAirport"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "arrivalAirport")
    }
  }

  public var departureAirport: Swift.Optional<String?> {
    get {
      return graphQLMap["departureAirport"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "departureAirport")
    }
  }

  public var currencyCode: Swift.Optional<String?> {
    get {
      return graphQLMap["currencyCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currencyCode")
    }
  }
}

public final class GetAirportQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAirport($iataCode: String!) {
      airport(iataCode: $iataCode) {
        __typename
        name
        iataCode
        cityCode
        countryCode
      }
    }
    """

  public let operationName: String = "getAirport"

  public var iataCode: String

  public init(iataCode: String) {
    self.iataCode = iataCode
  }

  public var variables: GraphQLMap? {
    return ["iataCode": iataCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("airport", arguments: ["iataCode": GraphQLVariable("iataCode")], type: .object(Airport.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(airport: Airport? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "airport": airport.flatMap { (value: Airport) -> ResultMap in value.resultMap }])
    }

    public var airport: Airport? {
      get {
        return (resultMap["airport"] as? ResultMap).flatMap { Airport(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "airport")
      }
    }

    public struct Airport: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Airport"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("iataCode", type: .scalar(String.self)),
        GraphQLField("cityCode", type: .scalar(String.self)),
        GraphQLField("countryCode", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, iataCode: String? = nil, cityCode: String? = nil, countryCode: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Airport", "name": name, "iataCode": iataCode, "cityCode": cityCode, "countryCode": countryCode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var iataCode: String? {
        get {
          return resultMap["iataCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "iataCode")
        }
      }

      public var cityCode: String? {
        get {
          return resultMap["cityCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cityCode")
        }
      }

      public var countryCode: String? {
        get {
          return resultMap["countryCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "countryCode")
        }
      }
    }
  }
}

public final class GetFaresQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getFares($dto: FarefinderDto!) {
      fares(dto: $dto) {
        __typename
        flightNumber
        price {
          __typename
          base {
            __typename
            currencyCode
            value
          }
          adjustment {
            __typename
            currencyCode
            value
          }
        }
        departureAirport
        arrivalAirport
        connectingAirport
        departureDate
        arrivalDate
      }
    }
    """

  public let operationName: String = "getFares"

  public var dto: FarefinderDto

  public init(dto: FarefinderDto) {
    self.dto = dto
  }

  public var variables: GraphQLMap? {
    return ["dto": dto]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("fares", arguments: ["dto": GraphQLVariable("dto")], type: .list(.object(Fare.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fares: [Fare?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "fares": fares.flatMap { (value: [Fare?]) -> [ResultMap?] in value.map { (value: Fare?) -> ResultMap? in value.flatMap { (value: Fare) -> ResultMap in value.resultMap } } }])
    }

    public var fares: [Fare?]? {
      get {
        return (resultMap["fares"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Fare?] in value.map { (value: ResultMap?) -> Fare? in value.flatMap { (value: ResultMap) -> Fare in Fare(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Fare?]) -> [ResultMap?] in value.map { (value: Fare?) -> ResultMap? in value.flatMap { (value: Fare) -> ResultMap in value.resultMap } } }, forKey: "fares")
      }
    }

    public struct Fare: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Fare"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("flightNumber", type: .scalar(String.self)),
        GraphQLField("price", type: .object(Price.selections)),
        GraphQLField("departureAirport", type: .scalar(String.self)),
        GraphQLField("arrivalAirport", type: .scalar(String.self)),
        GraphQLField("connectingAirport", type: .scalar(String.self)),
        GraphQLField("departureDate", type: .scalar(String.self)),
        GraphQLField("arrivalDate", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(flightNumber: String? = nil, price: Price? = nil, departureAirport: String? = nil, arrivalAirport: String? = nil, connectingAirport: String? = nil, departureDate: String? = nil, arrivalDate: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Fare", "flightNumber": flightNumber, "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }, "departureAirport": departureAirport, "arrivalAirport": arrivalAirport, "connectingAirport": connectingAirport, "departureDate": departureDate, "arrivalDate": arrivalDate])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var flightNumber: String? {
        get {
          return resultMap["flightNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "flightNumber")
        }
      }

      public var price: Price? {
        get {
          return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "price")
        }
      }

      public var departureAirport: String? {
        get {
          return resultMap["departureAirport"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "departureAirport")
        }
      }

      public var arrivalAirport: String? {
        get {
          return resultMap["arrivalAirport"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "arrivalAirport")
        }
      }

      public var connectingAirport: String? {
        get {
          return resultMap["connectingAirport"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "connectingAirport")
        }
      }

      public var departureDate: String? {
        get {
          return resultMap["departureDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "departureDate")
        }
      }

      public var arrivalDate: String? {
        get {
          return resultMap["arrivalDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "arrivalDate")
        }
      }

      public struct Price: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Price"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("base", type: .object(Base.selections)),
          GraphQLField("adjustment", type: .object(Adjustment.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(base: Base? = nil, adjustment: Adjustment? = nil) {
          self.init(unsafeResultMap: ["__typename": "Price", "base": base.flatMap { (value: Base) -> ResultMap in value.resultMap }, "adjustment": adjustment.flatMap { (value: Adjustment) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var base: Base? {
          get {
            return (resultMap["base"] as? ResultMap).flatMap { Base(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "base")
          }
        }

        public var adjustment: Adjustment? {
          get {
            return (resultMap["adjustment"] as? ResultMap).flatMap { Adjustment(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "adjustment")
          }
        }

        public struct Base: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PriceItem"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currencyCode", type: .scalar(String.self)),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(currencyCode: String? = nil, value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PriceItem", "currencyCode": currencyCode, "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var currencyCode: String? {
            get {
              return resultMap["currencyCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currencyCode")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }

        public struct Adjustment: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PriceItem"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("currencyCode", type: .scalar(String.self)),
            GraphQLField("value", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(currencyCode: String? = nil, value: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PriceItem", "currencyCode": currencyCode, "value": value])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var currencyCode: String? {
            get {
              return resultMap["currencyCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currencyCode")
            }
          }

          public var value: String? {
            get {
              return resultMap["value"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }
        }
      }
    }
  }
}

public final class GetAutocompleteQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAutocomplete($phrase: String) {
      autocomplete(phrase: $phrase) {
        __typename
        code
        city {
          __typename
          code
          name
          countryCode
        }
        country {
          __typename
          code
          name
          currency
          defaultAirportCode
        }
      }
    }
    """

  public let operationName: String = "getAutocomplete"

  public var phrase: String?

  public init(phrase: String? = nil) {
    self.phrase = phrase
  }

  public var variables: GraphQLMap? {
    return ["phrase": phrase]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("autocomplete", arguments: ["phrase": GraphQLVariable("phrase")], type: .list(.object(Autocomplete.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(autocomplete: [Autocomplete?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "autocomplete": autocomplete.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }])
    }

    public var autocomplete: [Autocomplete?]? {
      get {
        return (resultMap["autocomplete"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Autocomplete?] in value.map { (value: ResultMap?) -> Autocomplete? in value.flatMap { (value: ResultMap) -> Autocomplete in Autocomplete(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }, forKey: "autocomplete")
      }
    }

    public struct Autocomplete: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Autocomplete"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("code", type: .scalar(String.self)),
        GraphQLField("city", type: .object(City.selections)),
        GraphQLField("country", type: .object(Country.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: String? = nil, city: City? = nil, country: Country? = nil) {
        self.init(unsafeResultMap: ["__typename": "Autocomplete", "code": code, "city": city.flatMap { (value: City) -> ResultMap in value.resultMap }, "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: String? {
        get {
          return resultMap["code"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var city: City? {
        get {
          return (resultMap["city"] as? ResultMap).flatMap { City(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "city")
        }
      }

      public var country: Country? {
        get {
          return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "country")
        }
      }

      public struct City: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["City"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("countryCode", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, name: String? = nil, countryCode: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "City", "code": code, "name": name, "countryCode": countryCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return resultMap["code"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var countryCode: String? {
          get {
            return resultMap["countryCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "countryCode")
          }
        }
      }

      public struct Country: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Country"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("currency", type: .scalar(String.self)),
          GraphQLField("defaultAirportCode", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: String? = nil, name: String? = nil, currency: String? = nil, defaultAirportCode: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Country", "code": code, "name": name, "currency": currency, "defaultAirportCode": defaultAirportCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var code: String? {
          get {
            return resultMap["code"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var currency: String? {
          get {
            return resultMap["currency"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "currency")
          }
        }

        public var defaultAirportCode: String? {
          get {
            return resultMap["defaultAirportCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "defaultAirportCode")
          }
        }
      }
    }
  }
}
