import requests
import json


response = requests.get('https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow')
# Verifica si la solicitud fue exitosa (código 200)
if response.status_code == 200:
    # Utiliza el método .json() para obtener el contenido JSON
    parsed_data = response.json()
    total_elementos = len(parsed_data["items"])


def total_answered_responses():
    #Obtener el número de respuestas contestadas
    respuestas_contestadas = sum(1 for item in parsed_data['items'] if 'is_answered' in item and item['is_answered'] is True)
    return respuestas_contestadas


def total_not_answered_responses():
    #Obtener el total de respuestas no contestadas
    total_elementos = len(parsed_data["items"])
    respuestas_no_contestadas = total_elementos - total_answered_responses()
    return respuestas_no_contestadas


def less_views():
    #Obtener la respuesta con menor número de vistas
    menor_vistas_respuesta = min(parsed_data['items'], key=lambda x: x['view_count'])
    return menor_vistas_respuesta


def older():
    #Obtener la respuesta más vieja
    respuestas_ordenadas = sorted(parsed_data['items'], key=lambda x: x['creation_date'])
    respuesta_mas_vieja = respuestas_ordenadas[0]
    return respuesta_mas_vieja


def newest():
    #Obtener la respuesta más actual
    respuestas_ordenadas = sorted(parsed_data['items'], key=lambda x: x['creation_date'])
    respuesta_mas_actual = respuestas_ordenadas[-1]
    return respuesta_mas_actual

def more_reputation():
    #Obtener la respuesta del owner que tenga una mayor reputación
    owner_ids = [item['owner']['user_id'] for item in parsed_data['items'] if 'owner' in item and 'user_id' in item['owner']]
    reputaciones = {}
    for owner_id in owner_ids:
        user_url = f"https://api.stackexchange.com/2.2/users/{owner_id}?site=stackoverflow"
        user_response = requests.get(user_url)
        user_data = user_response.json()
        reputaciones[owner_id] = user_data['items'][0]['reputation']

    owner_con_max_reputacion_id = max(reputaciones, key=reputaciones.get)
    owner_con_max_reputacion_respuesta = next(item for item in parsed_data['items'] if 'owner' in item and item['owner']['user_id'] == owner_con_max_reputacion_id)
    return owner_con_max_reputacion_respuesta

#Imprimir en consola los resultados del punto 2 al 5
print(f"\n\nNúmero total de respuestas: {total_elementos}\n\n")
print(f"Número total de respuestas contestadas: {total_answered_responses()}\n\n")
print(f"Número total de respuestas no contestadas: {total_not_answered_responses()}\n\n")
print(f"Respuesta con menor número de vistas: {less_views()}\n\n")
print(f"Respuesta más vieja: {older()}\n\n")
print(f"Respuesta más actual: {newest()}\n\n")
print(f"Respuesta del owner con mayor reputación: {more_reputation()}\n\n")
print(f"Respuesta del owner con mayor reputación: {more_reputation()}\n\n")