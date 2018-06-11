public class AnimalLocator {

    public static String getAnimalNameById(Integer num){
        String retAnimalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String endpointStr = 'https://th-apex-http-callout.herokuapp.com/animals/' + num;
        request.setEndpoint(endpointStr);
        request.setMethod('GET');
        System.debug(request);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug(jsonMap);
            Map<String, Object> jsonMap2 = (Map<String, Object>) jsonMap.get('animal');
            retAnimalName = (String) jsonMap2.get('name');
            return retAnimalName;
        }
        else {
            return 'not animal Id';
        }
    }
        
}