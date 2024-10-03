//
//  Mock+PropertyDetail.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 3/10/24.
//

@testable import iOSChallenge

extension PropertyDetail {
    
    static func mock() -> PropertyDetail {
        
        PropertyDetail(id: 1,
                       price: 1195000.0,
                       priceInfo: DetailPriceInfo.mock(),
                       operation: "sale",
                       propertyType: "homes",
                       extendedPropertyType: "flat",
                       homeType: "flat",
                       state: "active",
                       multimedia: DetailMultimedia.mock(),
                       propertyComment: "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una de las zonas más exclusivas de Madrid, el Barrio de Salamanca, en la cotizada zona de Castellana, se encuentra este espacioso piso en venta de 133 m² que ofrece una oportunidad única para quienes buscan una vivienda que combine comodidad, ubicación y potencial de actualización.\n\nEl inmueble cuenta con un salón -comedor, amplio y luminoso, es perfecto para disfrutar de momentos de convivencia con la familia o amigos, y está conectado a un patio de uso privativo, una verdadera joya en pleno centro de la ciudad. Este espacio exterior es ideal para relajarse, organizar comidas al aire libre o incluso para ser transformado en una zona verde que aporte tranquilidad y frescura al hogar. La cocina es independiente y dispone de una cómoda zona de office, perfecta para las comidas cotidianas, además de contar con un práctico lavadero adjunto que facilita las tareas del hogar.",
                       ubication: Ubication.mock(),
                       country: "es",
                       moreCharacteristics: PropertyCharacteristics.mock(),
                       energyCertification: EnergyCertification.mock())
    }
}
