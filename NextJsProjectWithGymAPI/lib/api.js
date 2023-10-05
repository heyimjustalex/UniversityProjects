const BASIC_URL = "https://afefitness2023.azurewebsites.net/api";

export async function addTrainer(data, token) {
  try {
    console.log("Token:", token);
    const response = await fetch(BASIC_URL + "/Users", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      throw new Error(response.statusText);
    }
    return response;
  } catch (error) {
    console.log("Error Adding new Trainer:", error);
    throw error;
  }
}
export async function getWorkouts(data, token) {
  try {
    const response = await fetch(BASIC_URL + "/WorkoutPrograms", {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      throw new Error(`Request failed with status: ${response.status}`);
    }

    const result = await response;
    return result;
  } catch (error) {
    console.error("Error fetching workouts", error);
    throw error;
  }
}

export async function getWorkout(data, token) {
  try {
    const response = await fetch(BASIC_URL + "/WorkoutPrograms/" + data.id, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      throw new Error(`Request failed with status: ${response.status}`);
    }

    const result = await response;
    console.log("HERE RESULT" + result);
    return result;
  } catch (error) {
    console.error("Error fetching workouts", error);
    throw error;
  }
}

export async function getClients(data, token) {
  try {
    const response = await fetch(BASIC_URL + "/Users/Clients", {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
    });

    if (!response.ok) {
      throw new Error(`Request failed with status: ${response.status}`);
    }

    const result = await response;
    return result;
  } catch (error) {
    console.error("Error fetching workouts", error);
    throw error;
  }
}

export async function addUser(data, token) {
  try {
    const response = await fetch(BASIC_URL + "/Users", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      throw new Error(response.statusText);
    }

    return response;
  } catch (error) {
    console.error("Error Adding new User:", error);
    throw error;
  }
}

export async function addWorkout(data, token) {
  const seen = new WeakSet();

  try {
    const response = await fetch(BASIC_URL + "/WorkoutPrograms", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data, function (key, value) {
        // Check for circular references
        if (typeof value === "object" && value !== null) {
          if (seen.has(value)) {
            return;
          }
          seen.add(value);
        }
        return value;
      }),
    });

    if (!response.ok) {
      throw new Error(response.statusText);
    }

    return response;
  } catch (error) {
    console.error("Error Adding new Workout:", error);
    throw error;
  }
}

export async function addExercise(data, token) {
  try {
    const response = await fetch(BASIC_URL + "/Exercises", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    });

    if (!response.ok) {
      throw new Error(response.statusText);
    }

    return response;
  } catch (error) {
    console.error("Error Adding new Excersise:", error);
    throw error;
  }
}
