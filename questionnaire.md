---
title: Health Questionnaire
layout: page
permalink: /questionnaire/
header:
  image: "/assets/images/questionnaire-header.jpg"
  overlay_color: "rgba(0,0,0,0.3)"
---

## Health Questionnaire

<form id="health-form">

  <div class="field">
    <label class="label" for="email">E-Mail</label>
    <div class="control">
      <input class="input" type="email" id="email" name="Email" placeholder="Geben Sie Ihre E-Mail ein" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="country">Country</label>
    <div class="control">
      <input class="input" type="text" id="country" name="Country" placeholder="Land eingeben" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="age_group">Age Group</label>
    <div class="control">
      <select class="input" id="age_group" name="Age_group" required>
        <option value="">Wählen Sie Ihre Altersgruppe</option>
        <option value="18-24">18-24</option>
        <option value="25-34">25-34</option>
        <option value="35-44">35-44</option>
        <option value="45-54">45-54</option>
        <option value="55+">55+</option>
      </select>
    </div>
  </div>

  <div class="field">
    <label class="label" for="sex">Sex (M/F)</label>
    <div class="control">
      <select class="input" id="sex" name="Sex" required>
        <option value="">Wählen Sie Ihr Geschlecht</option>
        <option value="M">Male</option>
        <option value="F">Female</option>
      </select>
    </div>
  </div>

  <div class="field">
    <label class="label" for="height">Height (cm)</label>
    <div class="control">
      <input class="input" type="number" id="height" name="Height_cm" placeholder="Höhe in cm" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="weight">Weight (kg)</label>
    <div class="control">
      <input class="input" type="number" id="weight" name="Weight_kg" placeholder="Gewicht in kg" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="smoking">Smoking (0 = No, 1 = Yes)</label>
    <div class="control">
      <input class="input" type="number" id="smoking" name="Smoking" min="0" max="1" placeholder="0 oder 1" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="alcohol">Alcohol (0 = No, 1 = Yes)</label>
    <div class="control">
      <input class="input" type="number" id="alcohol" name="Alcohol" min="0" max="1" placeholder="0 oder 1" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="activity">Physical Activity (hours/week)</label>
    <div class="control">
      <input class="input" type="number" id="activity" name="Physical_Activity" placeholder="Stunden pro Woche" required>
    </div>
  </div>

  <div class="field">
    <label class="label" for="life_expectancy">Healthy Life Expectancy (years)</label>
    <div class="control">
      <input class="input" type="number" id="life_expectancy" name="Healthy_Life_Expectancy" placeholder="Erwartete gesunde Lebensjahre" required>
    </div>
  </div>

  <div class="field is-grouped">
    <div class="control">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>

</form>

## Choose Your Plan

<div class="columns is-multiline is-variable is-8">

  <div class="column is-half-tablet is-one-third-desktop plan-card">
    <div class="box has-text-centered is-hoverable">
      <h3 class="h3">Standard</h3>
      <p>Digital recommendations with concise health insights. Includes PDF download.</p>
      <a href="/subscribe/standard" class="btn btn-primary">Start Standard</a>
    </div>
  </div>

  <div class="column is-half-tablet is-one-third-desktop plan-card">
    <div class="box has-text-centered is-hoverable">
      <h3 class="h3">Premium</h3>
      <p>Digital recommendations with concise health insights, plus interactive insights and visualizations. Includes PDF download.</p>
      <a href="/subscribe/premium" class="btn btn-success">Upgrade to Premium</a>
    </div>
  </div>

</div>

<script>
document.getElementById('health-form').addEventListener('submit', async function(event) {
  event.preventDefault();

  const data = {
    Email: document.getElementById('email').value,
    Country: document.getElementById('country').value,
    Age_group: document.getElementById('age_group').value,
    Sex: document.getElementById('sex').value,
    Height_cm: parseFloat(document.getElementById('height').value),
    Weight_kg: parseFloat(document.getElementById('weight').value),
    Smoking: parseInt(document.getElementById('smoking').value),
    Alcohol: parseInt(document.getElementById('alcohol').value),
    Physical_Activity: parseFloat(document.getElementById('activity').value),
    Healthy_Life_Expectancy: parseFloat(document.getElementById('life_expectancy').value)
  };

  try {
    const response = await fetch('https://dein-render-api-url/recommendations/compact', {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(data)
    });
    const result = await response.json();
    alert("Recommendation token: " + (result.token || "n/a") + "\nText: " + result.recommendation_text);
  } catch (error) {
    console.error('Fehler beim Senden der Daten:', error);
    alert('Fehler beim Senden der Daten. Bitte versuchen Sie es erneut.');
  }
});
</script>
