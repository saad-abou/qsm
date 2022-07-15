<template>
<v-app>
    <v-container v-if="user.score">
        <h2><strong>Votre score est  {{ user.score }}</strong></h2>
        <v-card  class="p-4 mt-3" v-for='(answer , i) of user.user_answers' :key="i">
                <div v-for='(question , i) of questions' :key="i" >
                    <strong v-if="answer.reponse.question_id== question.id">{{ question.Qst  }}</strong>
                </div>
                {{ answer.reponse.rps }}
                <strong style="color:green" v-if="answer.answer == 1">Vrai</strong>
                <strong style="color:red" v-else>Faux</strong>
        </v-card>
    </v-container>
    <v-container v-else>
        <v-form ref="form" v-model="valid" lazy-validation >
            <v-card  class="p-4 mt-3" v-for='(question , i) of questions' :key="i">
                <v-row>
                <v-col  cols="12"  >
                    <strong>{{ question.Qst }}</strong>
                    <v-radio-group v-model="answers[question.id]">
                    <v-radio
                        :rules="allRule"
                        v-for='(reponse , index) of question.responses'
                        :key="index"
                        :label="reponse.rps"
                        :value="reponse"
                    ></v-radio>
                    </v-radio-group>
                    <v-divider></v-divider>
                </v-col>
                </v-row>
            </v-card>
        </v-form>
        <v-row>
            <v-col>
                <v-btn color="blue darken-4" text  :loading="loading" :disabled="loading" @click="validate()">
                    submit
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
</v-app>
</template>
<script>
import usersBulltin from './usersBulltin.vue'

export default {
    data() {
        return {
            score:false,
            user:[],
            questions:[],
            answers:[],
            allRule: [v => !!v || 'Ce champ est requis',],
            valid: true,
            loading: false,
        }
    },
    methods: {
        getData(){
            axios.get('getuser').then((res) =>{ this.user = res.data
                console.log(this.user)
                axios.get('getquestions').then((res) =>{ 
                    this.questions = res.data
                     console.log(this.questions)
                })
            })

        },
        validate () {
            if(this.$refs.form.validate()){
                    this.loading = true
                    axios.post('addAnswers', {
                        'answers':this.answers 
                    }).then((res)=>{
                        this.loading = false
                        this.getData()
                    })
            }
            else{
                alert('Veuillez remplir tous les champs avant de bénéficier de votre certificat !')
            }
        },
    },
    components:{
        usersBulltin,
    },

    created() {
        this.getData();
    },
}
</script>

<style lang="css">

.vote_section {
  width: 50%;
  margin: auto;
  border-radius: 5px;
  padding-top: 50px;
  padding-right: 50px;
  padding-bottom: 50px;
  padding-left: 50px;
  box-shadow: 5px 10px 18px #000000;
  font-size:2em;
}
.question{
  position: relative;
  font-family: "Times New Roman";
  text-shadow: 5px 10px 18px #000000;
}
@media screen and (max-width: 1280px){
 .vote_section {
  width: 100%;

}
.stats_section {
  width: 100%;

}
}

.reponses{
    display: flex;
    justify-content: space-around;
    margin-top:50px;
}

.stats_section{
  margin: auto;
  border-radius: 5px;
  padding-top: 50px;
  padding-right: 50px;
  padding-bottom: 50px;
  padding-left: 50px;
  font-family: "Times New Roman";
}

@media screen and (max-width: 1280px){
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
.rep{
    margin-top:20px
}
.v-progress-circular {
  margin: 1rem;
}

.reponseText{
  border: 2px solid;
  padding: 10px;
  border-radius: 15px;
  margin-bottom:3px
}
@media print {
   .noprint {
      visibility: hidden;
   }
}
</style>
