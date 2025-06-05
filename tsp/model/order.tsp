import "@typespec/http";
import "./model/order.tsp";

using Http;

@service(#{ title: "Order API Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@route("/api")
@tag("Order Api")

namespace OrderApi {
}