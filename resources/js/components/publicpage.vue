<template>
    <v-app>
        <v-row >
            <v-col align="center">
                <h1> Bienvenue aux QSM </h1>
                <v-btn text color="primary" href="/qsm" target="_blank">
                    Commancer
                <v-icon right dark>
                    fas fa-arrow-right
                </v-icon>
                </v-btn>
            </v-col>
        </v-row>
    </v-app>
</template>
<script>
export default {
    data() {
        return {
        }
    },

    methods: {
    },

    mounted() {
    },

}
</script>
<style>
.title{
     font-family: 'Imbue', serif;
     color:green
 }
 h1{
     font-family: 'Imbue', serif;
 }


.attente{
  width: 50%;
  margin: auto;
  border-radius: 5px;
  padding-top: 50px;
  padding-right: 50px;
  padding-bottom: 50px;
  padding-left: 50px;
  font-style: italic;
}
@media screen and (max-width: 1280px){
.attente {
  width: 100%;
}
}

#demo{
    font-size:2em;
}
</style>
